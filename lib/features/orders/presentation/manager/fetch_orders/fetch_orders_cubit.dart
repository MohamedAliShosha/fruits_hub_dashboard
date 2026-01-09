import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this.ordersRepo) : super(FetchOrdersInitial());

  final OrdersRepo ordersRepo;

  // StreamSubscription is a reference to a stream to enable us to cancel the stream
  StreamSubscription? _streamSubscription;

  void fetchOrders() {
    emit(FetchOrdersLoading());

    _streamSubscription = ordersRepo.fetchOrders().listen(
      (result) {
        result.fold(
          (failure) => emit(
            FetchOrdersFailure(
              failure.errorMessage,
            ),
          ),
          (orders) => emit(
            FetchOrdersSuccess(
              orders,
            ),
          ),
        );
      },
    );
  }

  // Cancel the stream subscription when the cubit is closed
  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }
}
