part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<ProductModel> cartItem;

  const CartState({required this.cartItem});

  @override
  List<Object> get props => [cartItem];

  CartState copyWith({
    List<ProductModel>? cartItem,
  }) {
    return CartState(
      cartItem: cartItem ?? this.cartItem,
    );
  }

  @override
  String toString() => 'CartState(cartItem: $cartItem)';
}
