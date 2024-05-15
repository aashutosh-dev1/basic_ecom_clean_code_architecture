import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shoesly/presentation/bloc/cart_cubit/cart_cubit.dart';
import 'package:shoesly/utils/assets_manager.dart';
import 'package:shoesly/utils/colors.dart';

import '../../core/routes/routes.dart';
import '../../data/models/product_model.dart';

class ProductDetailView extends StatefulWidget {
  final ProductModel productModel;

  const ProductDetailView({super.key, required this.productModel});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  ProductModel get product => widget.productModel;
  int _currentIndex = 0;
  Widget buildIndicator(int length) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index ? Colors.black : Colors.grey,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeHW = MediaQuery.sizeOf(context);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 90,
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Price"),
                  const Gap(5),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => openAddCartBottomSheet(context),
              child: Container(
                padding: const EdgeInsets.fromLTRB(13.0, 18.0, 24.0, 20.0),

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.primaryColor),
                //  13px, 24px, 13px, 24px
                child: const Text(
                  "ADD TO CART",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.cartRoute);
              },
              child: SvgPicture.asset(
                  context.watch<CartCubit>().state.cartItem.isNotEmpty
                      ? CustomAssetsManager().cartFilledIcon
                      : CustomAssetsManager().cartEmptyIcon)),
          const Gap(30),
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10.0),
                //image section

                Center(
                  child: Container(
                    height: 315,
                    width: 315,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primaryColor.withOpacity(0.1),
                    ),
                    child: Column(
                      children: [
                        const Gap(10),
                        CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: false,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                          items: product.image.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.network(
                                    i,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),

                        // Image.network(
                        //   product.image[1],
                        //   height: 200,
                        // ),
                        const Gap(50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Gap(20),
                            buildIndicator(product.image.length),
                            const Spacer(),
                            Container(
                              height: 40,
                              color: Colors.red,
                              child: const Icon(Icons.favorite),
                            ),
                            const Gap(20),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(30.0),

                //Product details
                Text(
                  product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 20.0),
                ),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        3,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    const Gap(5.0),
                    Text(
                      product.averageReview.toStringAsFixed(1),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 11.0),
                    ),
                    const Gap(5.0),
                    Text(
                      "(${product.reviews.length} Reviews)",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 11.0,
                        color: AppColors.primaryColor.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),

                //Product Size
                const Gap(30.0),
                const Text(
                  "Size",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),

                const Gap(10.0),
                Row(
                  children: List.generate(
                    product.sizes.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.neturalColor200,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            product.sizes[index],
                            style: TextStyle(
                                fontSize: 14.0,
                                color: AppColors.neturalColor400,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //Product Description Section
                const Gap(30.0),
                Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: AppColors.primaryColor,
                  ),
                ),
                const Gap(10),
                Text(
                  """${product.description} """,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.neturalColor400),
                ),
                //Review Section
                const Gap(30.0),
                const Text(
                  "Review",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                const Gap(20),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    product.reviews[index].userImage),
                              ),
                            ),
                          ),
                          const Gap(15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.reviews[index].userName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                              Row(
                                children: List.generate(
                                    product.reviews[index].userRating.ceil(),
                                    (index) => const Icon(
                                          Icons.star,
                                          size: 10.0,
                                          color: Colors.amber,
                                        )),
                              ),
                              const Gap(10),
                              SizedBox(
                                width: sizeHW.width * 0.7,
                                child: Text(
                                  """${product.reviews[index].userReview} """,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: product.reviews.length,
                ),

                Container(
                  height: 50,
                  width: sizeHW.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      color: AppColors.neturalColor200,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "SEE ALL REVIEW",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                const Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  openAddCartBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom / 2),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Add to cart",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "X",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Quantity",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 200,
                              child: TextField(),
                            )
                            // IconButton(
                            //   icon: const Icon(Icons.remove),
                            //   onPressed: () {},
                            // ),
                            // const Text("1"),
                            // IconButton(
                            //   icon: const Icon(Icons.add),
                            //   onPressed: () {},
                            // ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Total Price",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "\$235.00",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<CartCubit>()
                                  .addProductToCart(product);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text("ADD TO CART"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
