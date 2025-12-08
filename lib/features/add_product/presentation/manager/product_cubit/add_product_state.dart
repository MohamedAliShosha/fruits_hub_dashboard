part of 'add_product_cubit.dart';

@immutable
sealed class ProductState {}

final class AddProductInitial extends ProductState {}

final class AddProductLoading extends ProductState {}

final class AddProductSuccess extends ProductState {}

final class AddProductFailure extends ProductState {
  final String errorMessage;
  AddProductFailure(this.errorMessage);
}
