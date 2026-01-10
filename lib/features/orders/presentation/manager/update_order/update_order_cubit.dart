import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.orderRepo) : super(UpdateOrderInitial());

  final OrdersRepo orderRepo;

  Future<void> updateOrder(
      {required OrderStatus status, required String orderId}) async {
    emit(UpdateOrderLoading());
    final result = await orderRepo.updateOrder(
      status: status,
      orderId: orderId,
    );
    result.fold(
      (failure) => emit(
        UpdateOrderFailure(
          failure.errorMessage,
        ),
      ),
      (success) => emit(
        UpdateOrderSuccess(),
      ),
    );
  }
}
