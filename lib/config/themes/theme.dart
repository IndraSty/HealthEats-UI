import 'package:flutter/material.dart';
import 'package:healtheats/config/themes/custome_themes/appbar_theme.dart';
import 'package:healtheats/config/themes/custome_themes/elevated_button_theme.dart';
import 'package:healtheats/config/themes/custome_themes/text_theme.dart';
import 'package:healtheats/core/utils/constants.dart';

class HEAppTheme {
  HEAppTheme._();

  static ThemeData ligtTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: HETextTheme.lightTextTheme,
    elevatedButtonTheme: HEElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: HEAppBarTheme.lightAppBarTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.black38,
    textTheme: HETextTheme.darkTextTheme,
    elevatedButtonTheme: HEElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: HEAppBarTheme.darkAppBarTheme,
  );
}
