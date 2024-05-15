import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/presentation/bloc/discover_cubit/discover_cubit.dart';
import 'package:shoesly/utils/colors.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final discoverCubit = BlocProvider.of<DiscoverCubit>(context);
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 30.0, bottom: 0.0, right: 30.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final data = discoverCubit.state.categories![index];
          final isSelected =
              index == context.watch<DiscoverCubit>().state.selectedIndex;

          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                discoverCubit.selectCategory(index, brand: data.toString());
              },
              child: Center(
                  child: Text(
                data ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.neturalColor300,
                  fontSize: 20.0,
                ),
              )),
            ),
          );
        },
        itemCount: discoverCubit.state.categories?.length ?? 0,
      ),
    );
  }
}
