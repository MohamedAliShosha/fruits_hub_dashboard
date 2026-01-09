import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImplement implements OrdersRepo {
  final DatabaseService _databaseService;

  OrdersRepoImplement({required DatabaseService databaseService})
      : _databaseService = databaseService;

  @override
  Stream<Either<Failure, List<OrderEntity>>>
      // I used async* not async because async* is used with Stream
      fetchOrders() async* {
    try {
      await for (var data
          in _databaseService.getStreamData(path: BackendEndpoints.getOrders)) {
        List<OrderEntity> orders = (data as List<dynamic>)
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(
        ServerFailure(
          'Failed to fetch orders',
        ),
      );
    }
  }
}
