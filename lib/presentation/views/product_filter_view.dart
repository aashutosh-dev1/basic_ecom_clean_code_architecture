import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:shoesly/utils/colors.dart';

class ProductFilterView extends StatefulWidget {
  const ProductFilterView({super.key});

  @override
  State<ProductFilterView> createState() => _ProductFilterViewState();
}

class _ProductFilterViewState extends State<ProductFilterView> {
  RangeValues _currentRangeValues = const RangeValues(0, 1800);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 90,
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 17.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.neturalColor200,
                    )),
                //  13px, 24px, 13px, 24px
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 15),
                  child: Text(
                    "RESET",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => {Navigator.pop(context)},
              child: Container(
                padding: const EdgeInsets.fromLTRB(13.0, 18.0, 24.0, 20.0),

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.primaryColor),
                //  13px, 24px, 13px, 24px
                child: const Text(
                  "APPLY",
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
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text("Filter"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Text(
              "Brands",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.primaryColor),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.neturalColor200,
                        ),
                      ),
                      Text(index == 0
                          ? "Puma"
                          : index == 1
                              ? "NIKE"
                              : index == 2
                                  ? "Adidas"
                                  : "Reebok")
                    ],
                  ),
                ),
              ),
            ),
            const Gap(30),
            Text(
              "Price Range",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.primaryColor),
            ),
            const Gap(20),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: AppColors.primaryColor,
                inactiveTrackColor: AppColors.neturalColor200,
                thumbColor: Colors.black,
                overlayColor: Colors.black.withOpacity(0.2),
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 22.0),
              ),
              child: RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 1800,
                divisions: 4,
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$0'),
                Text('\$200'),
                Text('\$750'),
                Text('\$1800'),
              ],
            ),
            const Gap(30),
            Text(
              "Sort By",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.primaryColor),
            ),
            const Gap(20),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: index != 0
                              ? Colors.white
                              : AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(100.0),
                          border: Border.all(
                            color: AppColors.neturalColor200,
                          )),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          index == 0
                              ? "Most recent"
                              : index == 1
                                  ? "Lowest Price"
                                  : "Highest Review",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: index == 0
                                  ? Colors.white
                                  : AppColors.primaryColor),
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(30),
            Text(
              "Gender",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.primaryColor),
            ),
            const Gap(20),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.0),
                          border: Border.all(
                            color: index == 0
                                ? AppColors.primaryColor
                                : AppColors.neturalColor200,
                          )),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 0
                                    ? Colors.black
                                    : index == 1
                                        ? Colors.white
                                        : Colors.red,
                              ),
                            ),
                            const Gap(10),
                            Text(
                              index == 0
                                  ? "Black"
                                  : index == 1
                                      ? "White"
                                      : "Red",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
