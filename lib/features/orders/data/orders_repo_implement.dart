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
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
      const path = BackendEndpoints.getOrders;
      final response = await _databaseService.getData(path: path);
      List<OrderEntity> orders = (response as List<dynamic>)
          .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
          .toList();
      return Right(orders);
    } catch (e) {
      return Future.error(
        ServerFailure(
          'Failed to fetch orders',
        ),
      );
    }
  }
}
