import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesly/data/models/review_model.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit()
      : super(
          const ReviewState(
            categories: ["All"],
            reviews: [],
          ),
        );
  void clearReview() {
    emit(state.copyWith(reviews: List.empty(), categories: ["All"]));
  }
  void selectCategory(int selectedIndex,) {
    emit(state.copyWith(selectedIndex: selectedIndex));
  }
  FutureOr<void> fetchReviewByRatings(List<ReviewModel> reviews) async {
    final categories = List.of(state.categories!)
      ..addAll(
          reviews.map((e) => e.userRating.toStringAsFixed(0)).toSet().toList());

    emit(state.copyWith(categories: categories.toSet().toList()));
  }

  FutureOr<void> fetchRatingsByReview(
      String review, List<ReviewModel> reviews) async {
    final products = reviews;
    if (review == "All") {
      emit(state.copyWith(reviews: products));
    } else {
      final items = products
          .where((element) => element.userRating.toStringAsFixed(0) == review)
          .toList();
      emit(state.copyWith(reviews: items.toSet().toList()));
    }
    return null;
  }
}
