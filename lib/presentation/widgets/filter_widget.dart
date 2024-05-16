import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../core/routes/routes.dart';
import '../../utils/assets_manager.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productFilterRoute);
      },
      child: Container(
        width: 119,
        decoration: BoxDecoration(
            color: const Color(0xff101010),
            borderRadius: BorderRadius.circular(100)),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(CustomAssetsManager().filterIcon),
            const Gap(10),
            const Text(
              'FILTER',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
