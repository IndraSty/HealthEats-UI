import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';

class FullBoxShimmer extends StatelessWidget {
  const FullBoxShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      width: AppScreenSize.width,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          height: double.infinity,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.shimmer,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 10,
                width: 60,
                decoration: const BoxDecoration(color: AppColors.shimmer),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 30,
                width: double.infinity,
                decoration: const BoxDecoration(color: AppColors.shimmer),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 10,
                width: 40,
                decoration: const BoxDecoration(color: AppColors.shimmer),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
            color: AppColors.shimmer,
            shape: BoxShape.circle,
          ),
        )
      ]),
    );
  }
}
