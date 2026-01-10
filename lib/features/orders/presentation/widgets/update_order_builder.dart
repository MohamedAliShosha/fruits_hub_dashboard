import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/build_bar.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order/update_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateOrderBuilder extends StatelessWidget {
  const UpdateOrderBuilder({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is UpdateOrderLoading, child: child);
      },
      listener: (context, state) {
        if (state is UpdateOrderSuccess) {
          buildBar(context, 'Order Updated Successfully');
        }
        if (state is UpdateOrderFailure) {
          buildBar(context, state.errorMessage);
        }
      },
    );
  }
}
