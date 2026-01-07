import 'package:flutter/widgets.dart';

import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/order_item.dart';

class OrdersItemsListView extends StatelessWidget {
  const OrdersItemsListView({super.key, required this.orderEntity});

  final List<OrderEntity> orderEntity;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderEntity.length,
      itemBuilder: (context, index) {
        return OrderItemWidget(
          orderModel: orderEntity[index],
        );
      },
    );
  }
}
