import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manager/product_cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add_product_view.dart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add product'),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          getIt<ImagesRepo>(),
          getIt<ProductRepo>(),
        ),
        child: const AddProductViewBody(),
      ),
    );
  }
}
