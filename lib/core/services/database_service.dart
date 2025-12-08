// This class will contain all the methods that will be used to interact with the database => Read, Write, Delete, Update

abstract class DatabaseService {
  // path => could be an endpoint or a collection name
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId});

  Future<bool> checkIfDataExists(
      {required String path, required String documentId});
}
