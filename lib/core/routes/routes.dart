import 'package:flutter/material.dart';
import 'package:shoesly/data/models/product_model.dart';
import 'package:shoesly/data/models/review_model.dart';
import 'package:shoesly/presentation/views/cart_view.dart';
import 'package:shoesly/presentation/views/discover_view.dart';
import 'package:shoesly/presentation/views/order_summary_view.dart';
import 'package:shoesly/presentation/views/product_detail_view.dart';
import 'package:shoesly/presentation/views/product_filter_view.dart';
import 'package:shoesly/presentation/views/product_review_view.dart';
import 'package:shoesly/presentation/views/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String discoverRoute = "/discover";
  static const String productDetailRoute = "/product-detail";
  static const String productFilterRoute = "/product-filter";
  static const String productReviewRoute = "/product-review";
  static const String cartRoute = "/cart";
  static const String orderSummaryRoute = "/order-summary";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    return switch (settings.name) {
      Routes.splashRoute =>
        MaterialPageRoute(builder: (_) => const SplashView()),
      Routes.discoverRoute =>
        MaterialPageRoute(builder: (_) => const DiscoverView()),
      Routes.productDetailRoute => MaterialPageRoute(
          builder: (_) => ProductDetailView(
                productModel: settings.arguments as ProductModel,
              )),
      Routes.productFilterRoute => MaterialPageRoute(
          builder: (_) => const ProductFilterView(),
        ),
      Routes.productReviewRoute => MaterialPageRoute(
          builder: (_) => ProductReviewView(
            reviews: settings.arguments as List<ReviewModel>,
          ),
        ),
      Routes.cartRoute => MaterialPageRoute(
          builder: (_) => const CartView(),
        ),
      Routes.orderSummaryRoute => MaterialPageRoute(
          builder: (_) => const OrderSummaryView(),
        ),
      _ => MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(child: Text("No Routes Found")),
              ))
    };
  }
}
