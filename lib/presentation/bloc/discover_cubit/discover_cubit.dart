import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/constants/enums.dart';
import 'package:shoesly/domain/repository/fetch_data_repository.dart';

import '../../../data/models/product_model.dart';

part 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  final FetchDataRepository _repository;
  DiscoverCubit(this._repository)
      : super(
          const DiscoverState(
            appState: AppState.initial,
            products: [],
            categories: ["All"],
            selectedIndex: 0,
          ),
        );

  static DiscoverCubit of(BuildContext context) {
    final repository = RepositoryProvider.of<FetchDataRepository>(context);
    return DiscoverCubit(repository);
  }

  void selectCategory(int selectedIndex, {String brand = ""}) {
    fetchItemsByCategories(brand);
    emit(state.copyWith(selectedIndex: selectedIndex));
  }

  FutureOr<void> fetchData() async {
    emit(state.copyWith(appState: AppState.loading));
    try {
      final products = await _repository.fetchData();
      fetchCategories(products);
      emit(state.copyWith(
        appState: AppState.success,
        productsByCategories: products,
        products: products,
      ));
    } catch (e) {
      emit(state.copyWith(appState: AppState.error, error: e));
    }
  }

  FutureOr<void> fetchCategories(List<ProductModel> products) async {
    final categories = List.of(state.categories!)
      ..addAll(products.map((e) => e.brand).toSet().toList());

    emit(state.copyWith(categories: categories));
  }

  FutureOr<void> fetchItemsByCategories(String brand) async {
    final products = state.products;
    print(brand);
    if (brand == "All") {
      print(products!.length);

      emit(state.copyWith(productsByCategories: products));
    } else {
      if (products != null) {
        final items =
            products.where((element) => element.brand == brand).toList();
        print(items.length);
        emit(state.copyWith(productsByCategories: items));
      }
    }
  }
}
