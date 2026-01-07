import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo_implement.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo_implement.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storag_service.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_storage.dart';
import 'package:fruits_hub_dashboard/features/orders/data/orders_repo_implement.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(
    SupabaseStorageService(),
  );
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImplement(
      getIt<StorageService>(),
    ),
  );
  getIt.registerSingleton<DatabaseService>(
    FireStoreService(),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductsRepoImplement(getIt<DatabaseService>()),
  );
  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImplement(
      databaseService: getIt<FireStoreService>(),
    ),
  );
}
