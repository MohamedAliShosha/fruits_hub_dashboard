import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/dashboard/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(builder: (_) {
    switch (settings.name) {
      case DashboardView.routeName:
        return const DashboardView();

      default:
        return const Scaffold();
    }
  });
}
