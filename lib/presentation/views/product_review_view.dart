import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shoesly/presentation/bloc/review_cubit/review_cubit.dart';

import '../../data/models/review_model.dart';
import '../../utils/colors.dart';

class ProductReviewView extends StatefulWidget {
  final List<ReviewModel> reviews;
  const ProductReviewView({super.key, required this.reviews});

  @override
  State<ProductReviewView> createState() => _ProductReviewViewState();
}

class _ProductReviewViewState extends State<ProductReviewView> {
  List<ReviewModel> get reviews => widget.reviews;
  @override
  void initState() {
    super.initState();
    context.read<ReviewCubit>().fetchReviewByRatings(reviews);
    context.read<ReviewCubit>().fetchRatingsByReview("All", reviews);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.read<ReviewCubit>().clearReview();
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text("Reviews (${reviews.length})"),
      ),
      body: BlocBuilder<ReviewCubit, ReviewState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                        left: 30.0, bottom: 0.0, right: 30.0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final data = state.categories![index];

                      return Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: InkWell(
                          onTap: () {
                            context
                                .read<ReviewCubit>()
                                .fetchRatingsByReview(data, reviews);
                          },
                          child: Center(
                              child: Text(
                            data ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.neturalColor300,
                              fontSize: 20.0,
                            ),
                          )),
                        ),
                      );
                    },
                    itemCount: state.categories?.length ?? 0,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
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
                                    image:
                                        NetworkImage(reviews[index].userImage),
                                  ),
                                ),
                              ),
                              const Gap(15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    reviews[index].userName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(
                                        reviews[index].userRating.toInt(),
                                        (index) => const Icon(
                                              Icons.star,
                                              size: 10.0,
                                              color: Colors.amber,
                                            )),
                                  ),
                                  const Gap(10),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.7,
                                    child: Text(
                                      """${reviews[index].userReview} """,
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
                      itemCount:
                          context.watch<ReviewCubit>().state.reviews?.length),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
