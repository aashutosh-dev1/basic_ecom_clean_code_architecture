import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shoesly/core/constants/enums.dart';
import 'package:shoesly/core/routes/routes.dart';
import 'package:shoesly/presentation/bloc/cart_cubit/cart_cubit.dart';
import 'package:shoesly/presentation/views/product_detail_view.dart';
import 'package:shoesly/presentation/widgets/category_widget.dart';
import 'package:shoesly/presentation/widgets/persistant_category.dart';
import 'package:shoesly/presentation/widgets/products_widget.dart';

import '../../utils/assets_manager.dart';
import '../bloc/discover_cubit/discover_cubit.dart';
import '../widgets/filter_widget.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverCubit, DiscoverState>(
      // buildWhen: (previous, current) {
      //   return current.appState != previous.appState;
      // },
      builder: (context, state) {
        return switch (state.appState) {
          AppState.loading => const Center(child: CircularProgressIndicator()),
          AppState.success => Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: FilterWidget(),
              ),
              appBar: AppBar(
                title: InkWell(
                  onTap: () async {},
                  child: const Text(
                    "Discover",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                centerTitle: false,
                actions: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.cartRoute);
                      },
                      child: SvgPicture.asset(
                          context.watch<CartCubit>().state.cartItem.isNotEmpty
                              ? CustomAssetsManager().cartFilledIcon
                              : CustomAssetsManager().cartEmptyIcon)),
                  const Gap(30),
                ],
              ),
              body: CustomScrollView(
                slivers: [
                  //Header Category Widget
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: PersistentHeader(
                      widget: const CategoryWidget(),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Gap(20),
                  ),
                  //Body Products Widgets
                  SliverToBoxAdapter(
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      itemCount: state.productsByCategories?.length ?? 0,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailView(
                                productModel:
                                    state.productsByCategories![index],
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              right: 15.0, bottom: 20.0, left: 30.0),
                          child: ProductsWidget(
                            productModel: state.productsByCategories![index],
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          AppState.error => Center(child: Text('Error Occured ${state.error}')),
          _ => const Center(child: Text('Something went wrong')),
        };
      },
    );
  }
}
