import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/get_order_dummu_data.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/fetch_orders/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/orders_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersViewBodyBlocBuilder extends StatefulWidget {
  const OrdersViewBodyBlocBuilder({
    super.key,
  });

  @override
  State<OrdersViewBodyBlocBuilder> createState() =>
      _OrdersViewBodyBlocBuilderState();
}

class _OrdersViewBodyBlocBuilderState extends State<OrdersViewBodyBlocBuilder> {
  @override
  initState() {
    context.read<FetchOrdersCubit>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrdersViewBody(
            orders: state.orders,
          );
        } else if (state is FetchOrdersFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Skeletonizer(
            child: OrdersViewBody(
              orders: [
                getDummyOrder(),
                getDummyOrder(),
              ],
            ),
          );
        }
      },
    );
  }
}
