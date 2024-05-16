import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState(cartItem: []));

  resetCartItems(){
    emit(state.copyWith(cartItem: [],));
  }

 void addProductToCart(ProductModel product, int newQty) {
    List<ProductModel> updatedCart = List.of(state.cartItem);

    int existingIndex = updatedCart.indexWhere((item) => item.id == product.id);

    if (existingIndex != -1) {
      updatedCart[existingIndex] = updatedCart[existingIndex].copyWith(
        minQty: updatedCart[existingIndex].minQty + newQty,
      );
    } else {
      updatedCart.add(product.copyWith(minQty: newQty));
  }

    emit(state.copyWith(cartItem: updatedCart));
  }

  FutureOr<void> deleteCartItem(String productID) {
    List<ProductModel> cartItems = List.from(state.cartItem);
    cartItems.removeWhere(
      (element) => element.id == productID,
    );
    emit(state.copyWith(cartItem: cartItems));
  }

  void increaseQuantity(String productId) {
    final List<ProductModel> updatedCart = state.cartItem.map((product) {
      if (product.id == productId) {
        return product.copyWith(minQty: product.minQty++);
      } else {
        return product;
      }
    }).toList();
    emit(state.copyWith(cartItem: updatedCart));
  }

  void decreaseQuantity(String productId) {
    final List<ProductModel> updatedCart = state.cartItem.map((product) {
      if (product.id == productId) {
        return product.copyWith(minQty: product.minQty--);
      } else {
        return product;
      }
    }).toList();
    emit(state.copyWith(cartItem: updatedCart));
  }
}
