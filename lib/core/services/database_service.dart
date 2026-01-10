// This class will contain all the methods that will be used to interact with the database => Read, Write, Delete, Update

abstract class DatabaseService {
  // path => could be an endpoint or a collection name
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String?
        documentId, // the id of the document that contains the data we want to update
  });

  Future<dynamic> getData({
    required String path,
    String? documentId,
    // used to filter the data we will filter products based on these query parameters
    Map<String, dynamic>? query,
  });
  Stream<dynamic> getStreamData({
    required String path,
    // used to filter the data we will filter products based on these query parameters
    Map<String, dynamic>? query,
  });

  Future<bool> checkIfDataExists(
      {required String path, required String documentId});
}
