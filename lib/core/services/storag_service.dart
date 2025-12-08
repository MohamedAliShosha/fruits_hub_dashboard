abstract class StorageService {
  // The return type is String because this method will return the url of the uploaded image
  Future<String> uploadFile(
      String
          file); // parameter of type String because I will upload the image at base64 format
}
