import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo_implement.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo_implement.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/fire_storage.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storag_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(
    FireStorage(),
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
}
