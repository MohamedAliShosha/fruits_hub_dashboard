part of 'fetch_orders_cubit.dart';

sealed class FetchOrdersState {}

final class FetchOrdersInitial extends FetchOrdersState {}

final class FetchOrdersLoading extends FetchOrdersState {}

final class FetchOrdersSuccess extends FetchOrdersState {
  FetchOrdersSuccess(this.orders);
  final List<OrderEntity> orders;
}

final class FetchOrdersFailure extends FetchOrdersState {
  final String errorMessage;
  FetchOrdersFailure(this.errorMessage);
}
