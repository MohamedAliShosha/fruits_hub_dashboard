import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String code;
  final String desc;
  final num price;
  final File image;
  final bool isFeatured;
  // This url of the image that will be uploaded to DB not the image itself
  final String? imageUrl;

  AddProductInputEntity({
    this.imageUrl,
    required this.name,
    required this.code,
    required this.desc,
    required this.price,
    required this.image,
    required this.isFeatured,
  });
}
