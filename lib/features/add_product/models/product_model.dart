import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String desc;
  final num price;
  final File image;
  final bool isFeatured;
  // This url of the image that will be uploaded to DB not the image itself
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final num averageRating = 0;
  final num ratingCount = 0;
  final int numberOfCalories;
  final int unitAmount;
  final List<ReviewModel> reviews;

  ProductModel({
    this.imageUrl,
    required this.reviews,
    required this.expirationMonths,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.name,
    required this.code,
    required this.desc,
    required this.price,
    required this.image,
    required this.isFeatured,
  });

  // Used to create an AddProductInputModel through AddProductInputEntity
  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      expirationMonths: entity.expirationMonths,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
      isOrganic: entity.isOrganic,
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
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'reviews': reviews
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    };
  }
}
