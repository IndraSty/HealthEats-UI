import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';

class HETextTheme {
  HETextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: AppColors.fontColor),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: AppColors.fontColor),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AppColors.fontColor),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: AppColors.fontColor),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: AppColors.fontColor),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: AppColors.fontColor),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: AppColors.fontColor),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: AppColors.fontColor),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors.fontColor),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: AppColors.fontColor),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: AppColors.fontColor.withOpacity(0.5)),
    labelSmall: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textGray,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.white.withOpacity(0.5)),
    labelSmall: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );
}
