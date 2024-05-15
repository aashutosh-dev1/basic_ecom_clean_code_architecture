import 'dart:convert';

import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final String userName;
  final String userImage;
  final String userReview;
  final double userRating;

  const ReviewModel({
    required this.userName,
    required this.userImage,
    required this.userReview,
    required this.userRating,
  });

  @override
  List<Object> get props => [userName, userImage, userReview, userRating];

  ReviewModel copyWith({
    String? userName,
    String? userImage,
    String? userReview,
    double? userRating,
  }) {
    return ReviewModel(
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      userReview: userReview ?? this.userReview,
      userRating: userRating ?? this.userRating,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'userName': userName});
    result.addAll({'userImage': userImage});
    result.addAll({'userReview': userReview});
    result.addAll({'userRating': userRating});
  
    return result;
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      userName: map['userName'] ?? '',
      userImage: map['userImage'] ?? '',
      userReview: map['userReview'] ?? '',
      userRating: map['userRating']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) => ReviewModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReviewModel(userName: $userName, userImage: $userImage, userReview: $userReview, userRating: $userRating)';
  }
}
