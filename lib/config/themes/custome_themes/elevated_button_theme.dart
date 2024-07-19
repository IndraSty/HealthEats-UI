import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';

class HEElevatedButtonTheme {
  HEElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primaryColor,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: AppColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: AppTextStyles.poppins_16_semibold_white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primaryColor,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: AppColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: AppTextStyles.poppins_16_semibold_white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
