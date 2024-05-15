import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoesly/data/models/product_model.dart';
import 'package:shoesly/presentation/bloc/cart_cubit/cart_cubit.dart';
import 'package:shoesly/utils/colors.dart';

class CartItemWidget extends StatefulWidget {
  final ProductModel productModel;
  final int i;
  final void Function()? increaseCart;
  final void Function()? decreaseCart;
  final int? qty;
  const CartItemWidget({
    super.key,
    required this.productModel,
    required this.i,
    this.qty,
    this.increaseCart,
    this.decreaseCart,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int minQty = 1;

  String calculatePrice() {
    return (widget.qty! * widget.productModel.price).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  context
                      .read<CartCubit>()
                      .deleteCartItem(widget.productModel.id);
                },
                child: Container(
                  height: 88,
                  width: 88,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.amberAccent,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.productModel.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16.0),
                    ),
                    Text(' ${widget.productModel.brand}. Red Grey . 40',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(calculatePrice(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: widget.decreaseCart,
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: (widget.qty! <= 1)
                                    ? AppColors.neturalColor200
                                    : AppColors.primaryColor,
                              ),
                            ),
                            Text("${widget.qty}"),
                            IconButton(
                              onPressed: widget.increaseCart,
                              icon: const Icon(Icons.add_circle_outline_sharp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
