import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../data/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cartItem: []));

  FutureOr<void> addProductToCart(ProductModel product) {
    emit(state.copyWith(cartItem: List.of(state.cartItem)..add(product)));
  }

  FutureOr<void> deleteCartItem(String productID) {
    List<ProductModel> cartItems = List.from(state.cartItem);
    cartItems.removeWhere(
      (element) => element.id == productID,
    );
    emit(state.copyWith(cartItem: cartItems));
  }

  Future<void> increaseQte(ProductModel product) async {
    print(product.minQty);
  }
}
