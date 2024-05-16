part of 'review_cubit.dart';

class ReviewState extends Equatable {
  final List<String>? categories;
  final List<ReviewModel>? reviews;
  final int selectedIndex;

  const ReviewState({
    this.categories,
    this.reviews,
    this.selectedIndex = 0,
  });

  @override
  List<Object> get props => [categories!, reviews!];

  ReviewState copyWith({
    List<String>? categories,
    List<ReviewModel>? reviews,
    int? selectedIndex,
  }) {
    return ReviewState(
      categories: categories ?? this.categories,
      reviews: reviews ?? this.reviews,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
