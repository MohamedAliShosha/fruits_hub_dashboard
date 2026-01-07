import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/app_button.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/orders_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton(
            text: 'Add data',
            onPressed: () {
              // Navigate to add data view
              Navigator.pushNamed(context, AddProductView.routeName);
            },
          ),
          const SizedBox(height: 16),
          AppButton(
            text: 'View Orders',
            onPressed: () {
              // Navigate to add data view
              Navigator.pushNamed(context, OrdersView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
