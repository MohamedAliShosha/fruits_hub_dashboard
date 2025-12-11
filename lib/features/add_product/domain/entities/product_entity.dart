import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final String code;
  final String desc;
  final num price;
  final File image;
  String? imageUrl;
  final bool isFeatured;
  final int expirationMonths;
  final bool isOrganic;
  final num averageRating = 0;
  final num ratingCount = 0;
  final int numberOfCalories;
  final int unitAmount;
  final List<ReviewEntity> reviews;
  ProductEntity({
    required this.expirationMonths,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    this.imageUrl,
    required this.name,
    required this.code,
    required this.desc,
    required this.price,
    required this.image,
    required this.isFeatured,
  });
}
