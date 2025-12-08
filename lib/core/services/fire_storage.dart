import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storag_service.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageService {
  // Create a storage reference from our app
  final storageRef = FirebaseStorage.instance.ref();

  @override
  // In general this method accept file and return a string
  Future<String> uploadFile(File file, String path) async {
    // getting the name of the file using the path of the file "file.path" not the ref path "String path"
    String fileName = b.basename(file.path);
    // getting the extension name of the file using the path of the file "file.path" not the ref path "String path"
    String extensionName = b.extension(file.path);
    var fileReference = storageRef.child('$path/$fileName.$extensionName');
    // putFile is used to Upload a [File] from the filesystem. The file must exist.
    await fileReference.putFile(file);
    var imageUrl = await fileReference.getDownloadURL();
    return imageUrl;
  }
}
