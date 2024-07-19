import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';

class HEAppBarTheme {
  HEAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: const IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: AppTextStyles.poppins_18_semibold,
  );
  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: const IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: AppTextStyles.poppins_18_semibold_white,
  );
}
