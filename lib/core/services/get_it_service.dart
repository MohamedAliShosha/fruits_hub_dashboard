import 'package:fruits_hub_dashboard/core/services/firestorage.dart';
import 'package:fruits_hub_dashboard/core/services/storag_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(
    FireStorage(),
  );
}
