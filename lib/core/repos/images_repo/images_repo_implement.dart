import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/storag_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoints.dart';

class ImagesRepoImplement implements ImagesRepo {
  final StorageService storageService;
  ImagesRepoImplement(this.storageService);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      var url = await storageService.uploadFile(image, BackendEndpoints.images);
      return Right(url);
    } catch (e) {
      return left(
        ServerFailure('Failed to upload image'),
      );
    }
  }
}
