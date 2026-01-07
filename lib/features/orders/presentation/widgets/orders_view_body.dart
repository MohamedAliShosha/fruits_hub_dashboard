import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/functions/get_order_dummu_data.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/filter_section.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/order_items_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const FilterSection(),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: OrdersItemsListView(orderEntity: [
              getDummyOrder(),
              getDummyOrder(),
              getDummyOrder(),
              getDummyOrder(),
              getDummyOrder(),
              getDummyOrder(),
            ]),
          ),
        ],
      ),
    );
  }
}
