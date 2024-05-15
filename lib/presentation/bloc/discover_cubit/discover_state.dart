part of 'discover_cubit.dart';

class DiscoverState extends Equatable {
  final AppState? appState;
  final List<ProductModel>? products;
  final List<ProductModel>? productsByCategories;
  final List<String>? categories;
  final dynamic error;
  final int selectedIndex;
  const DiscoverState({
    this.appState,
    this.products,
    this.error,
    this.productsByCategories = const [],
    this.categories = const [],
    this.selectedIndex = 0,
  });

  @override
  List<Object> get props => [
        appState!,
        products!,
        categories!,
        productsByCategories!,
        selectedIndex,
      ];

  DiscoverState copyWith({
    AppState? appState,
    List<ProductModel>? products,
    List<ProductModel>? productsByCategories,
    List<String>? categories,
    dynamic error,
    int? selectedIndex,
  }) {
    return DiscoverState(
      appState: appState ?? this.appState,
      products: products ?? this.products,
      productsByCategories: productsByCategories ?? this.productsByCategories,
      categories: categories ?? this.categories,
      error: error ?? this.error,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
