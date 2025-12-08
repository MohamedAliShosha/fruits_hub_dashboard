import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String code;
  final String desc;
  final num price;
  final File image;
  final bool isFeatured;
  // This url of the image that will be uploaded to DB not the image itself
  String? imageUrl;

  AddProductInputModel({
    this.imageUrl,
    required this.name,
    required this.code,
    required this.desc,
    required this.price,
    required this.image,
    required this.isFeatured,
  });

  // Used to create an AddProductInputModel through AddProductInputEntity
  factory AddProductInputModel.fromEntity(AddProductInputEntity entity) {
    return AddProductInputModel(
      imageUrl: entity.imageUrl,
      name: entity.name,
      code: entity.code,
      desc: entity.desc,
      price: entity.price,
      image: entity.image,
      isFeatured: entity.isFeatured,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'desc': desc,
      'price': price,
      'image': image.path,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
    };
  }
}
