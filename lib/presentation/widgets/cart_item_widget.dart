import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoesly/data/models/product_model.dart';
import 'package:shoesly/presentation/bloc/cart_cubit/cart_cubit.dart';
import 'package:shoesly/utils/colors.dart';

class CartItemWidget extends StatefulWidget {
  final ProductModel productModel;
  final int i;
  const CartItemWidget({
    Key? key,
    required this.productModel,
    required this.i,
  }) : super(key: key);

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int minQty = 1;

  String calculatePrice() {
    if (minQty == 1) {
      return widget.productModel.price.toStringAsFixed(2);
    } else {
      return (minQty * widget.productModel.price).toStringAsFixed(2);
    }
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
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16.0),
                    ),
                    Text(' ${widget.productModel.brand}. Red Grey . 40',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${calculatePrice()}",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: (minQty <= 1)
                                  ? () {}
                                  : () {
                                      minQty--;
                                      setState(() {});
                                    },
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: (minQty <= 1)
                                    ? AppColors.neturalColor200
                                    : AppColors.primaryColor,
                              ),
                            ),
                            Text("${widget.productModel.minQty}"),
                            IconButton(
                              onPressed: () {
                                context.read<CartCubit>().increaseQte(widget
                                    .productModel
                                    .copyWith(minQty: minQty++));
                              },
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
