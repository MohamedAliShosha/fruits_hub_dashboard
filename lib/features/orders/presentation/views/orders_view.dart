import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const routeName = 'orders-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: const OrdersViewBody(),
    );
  }
}
