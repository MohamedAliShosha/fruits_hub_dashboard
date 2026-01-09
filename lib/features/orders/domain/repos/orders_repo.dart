import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  // I changed from future to stream to get real time updates
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();
}
