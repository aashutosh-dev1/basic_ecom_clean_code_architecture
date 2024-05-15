import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:shoesly/data/models/product_model.dart';
import 'package:shoesly/utils/colors.dart';

class ProductsWidget extends StatefulWidget {
  final ProductModel productModel;
  const ProductsWidget({
    super.key,
    required this.productModel,
  });

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  ProductModel get product => widget.productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.brand,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    )),
                const Gap(4.0),
                SizedBox(
                  height: 100,
                  width: 120,
                  child: Image.network(
                    product.image[0],
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Gap(10),
        SizedBox(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Gap(5.0),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  const Gap(2.0),
                  Text(
                    product.averageReview.ceil().toDouble().toString(),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(3.0),
                  Text(
                    " (${product.reviews.length}) Reviews",
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              Text(
                "\$${product.price}",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
