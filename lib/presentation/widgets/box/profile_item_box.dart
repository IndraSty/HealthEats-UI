import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';

class ProfileItemBox extends StatelessWidget {
  const ProfileItemBox({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: AppTextStyles.poppins_12_medium,
              )
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 14,
            color: AppColors.textGray,
          )
        ],
      ),
    );
  }
}
