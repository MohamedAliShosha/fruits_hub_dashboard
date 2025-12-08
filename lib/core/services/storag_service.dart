import 'dart:io';

abstract class StorageService {
  // The return type is String because this method will return the url of the uploaded image
  Future<String> uploadFile(
      File
          file, // parameter of type File because I will upload the image at File format in general and if I want to convert the file to any other type I will do that in the implementation of the method
      // This is the path of the will be uploaded file
      String path);
}
