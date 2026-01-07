import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/orders_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(builder: (_) {
    switch (settings.name) {
      case DashboardView.routeName:
        return const DashboardView();
      case OrdersView.routeName:
        return const OrdersView();
      case AddProductView.routeName:
        return const AddProductView();

      default:
        return const Scaffold();
    }
  });
}
