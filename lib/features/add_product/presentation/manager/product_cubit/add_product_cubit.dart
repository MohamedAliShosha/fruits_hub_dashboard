import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productRepo)
      : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(AddProductInputEntity addProductInput) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addProductInput.image);

    result.fold(
      (failure) => emit(
        AddProductFailure(
          failure.errorMessage,
        ),
      ),
      (url) async {
        addProductInput.imageUrl = url;
        var result = await productRepo.addProduct(addProductInput);
        result.fold(
          (failure) => emit(
            AddProductFailure(
              failure.errorMessage,
            ),
          ),
          (right) => emit(AddProductSuccess()),
        );
      },
    );
  }
}
