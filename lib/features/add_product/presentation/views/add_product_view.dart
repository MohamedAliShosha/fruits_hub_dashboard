import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add_product_view.dart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add product'),
      body: const AddProductViewBody(),
    );
  }
}
