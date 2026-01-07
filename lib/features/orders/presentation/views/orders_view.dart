import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/fetch_orders/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const routeName = 'orders-view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchOrdersCubit(
        getIt<OrdersRepo>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: const OrdersViewBody(),
      ),
    );
  }
}
