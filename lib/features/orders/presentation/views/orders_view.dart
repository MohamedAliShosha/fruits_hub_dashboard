import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/fetch_orders/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order/update_order_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/orders_view_bloc_builder.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/update_order_builder.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const routeName = 'orders-view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchOrdersCubit(
            getIt<OrdersRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => UpdateOrderCubit(
            getIt<OrdersRepo>(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: const UpdateOrderBuilder(
          child: OrdersViewBodyBlocBuilder(),
        ),
      ),
    );
  }
}
