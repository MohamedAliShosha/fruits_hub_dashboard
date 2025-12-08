import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storag_service.dart';

class FireStorage implements StorageService {
  // Create a storage reference from our app
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile(String file) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }
}
