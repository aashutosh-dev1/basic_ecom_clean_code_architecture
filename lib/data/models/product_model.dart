import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:shoesly/data/models/review_model.dart';

class ProductModel extends Equatable {
  final String name;
  final List<String> image;
  final String description;
  final double price;
  final List<String> sizes;
  final List<String> colors;
  final String brand;
  final String brandLogo;
  final String id;
  int minQty;

  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.sizes,
    required this.colors,
    required this.brand,
    required this.brandLogo,
    required this.id,
    this.minQty = 1,
    required this.reviews,
  });

  // calculating average review for product, without using firebase functions
  double get averageReview {
    if (reviews.isEmpty) {
      return 0.0;
    } else {
      double totalReview = 0.0;
      for (var review in reviews) {
        totalReview += review.userRating;
      }
      return totalReview / reviews.length;
    }
  }

  double getTotalPrice() {
    return minQty * price;
  }

  @override
  List<Object> get props {
    return [
      name,
      image,
      description,
      price,
      sizes,
      colors,
      brand,
      brandLogo,
      id,
      reviews,
    ];
  }

  ProductModel copyWith({
    String? name,
    List<String>? image,
    String? description,
    double? price,
    List<String>? sizes,
    List<String>? colors,
    String? brand,
    String? brandLogo,
    String? id,
    int? minQty,
    List<ReviewModel>? reviews,
  }) {
    return ProductModel(
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      price: price ?? this.price,
      sizes: sizes ?? this.sizes,
      colors: colors ?? this.colors,
      brand: brand ?? this.brand,
      brandLogo: brandLogo ?? this.brandLogo,
      id: id ?? this.id,
      minQty: minQty ?? this.minQty,
      reviews: reviews ?? this.reviews,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'description': description});
    result.addAll({'price': price});
    result.addAll({'sizes': sizes});
    result.addAll({'colors': colors});
    result.addAll({'brand': brand});
    result.addAll({'brandLogo': brandLogo});
    result.addAll({'id': id});
    if (minQty != null) {
      result.addAll({'minQty': minQty});
    }
    result.addAll({'reviews': reviews.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] ?? '',
      image: List<String>.from(map['image']),
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      sizes: List<String>.from(map['sizes']),
      colors: List<String>.from(map['colors']),
      brand: map['brand'] ?? '',
      brandLogo: map['brandLogo'] ?? '',
      id: map['id'] ?? '',
      minQty: map['minQty']?.toInt(),
      reviews: List<ReviewModel>.from(
          map['reviews']?.map((x) => ReviewModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(name:minQty: $minQty, )';
  }
}
