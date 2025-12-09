import 'package:fruits_hub_dashboard/features/add_product/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num rating;
  final String date;
  final String reviewDesc;

  ReviewModel(
      {required this.name,
      required this.reviewDesc,
      required this.image,
      required this.rating,
      required this.date});

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      reviewDesc: entity.reviewDesc,
      image: entity.image,
      rating: entity.rating,
      date: entity.date,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      rating: json['rating'],
      date: json['date'],
      reviewDesc: json['reviewDesc'],
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'rating': rating,
      'date': date,
      'reviewDesc': reviewDesc,
    };
  }
}
