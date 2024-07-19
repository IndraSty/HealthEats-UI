import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';

class AppBarShimmer extends StatelessWidget {
  const AppBarShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 58,
          width: 58,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.shimmer,
          ),
          padding: const EdgeInsets.all(2),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 30,
              height: 10,
              decoration: BoxDecoration(
                color: AppColors.shimmer,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 60,
              height: 10,
              decoration: BoxDecoration(
                color: AppColors.shimmer,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
