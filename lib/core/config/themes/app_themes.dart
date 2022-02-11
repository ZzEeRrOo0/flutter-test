import 'package:flutter/material.dart';
import 'package:morphosis_flutter_demo/core/constant/colors.dart';

class CustomTheme {
  static ThemeData get mainTheme {
    return ThemeData(
      primarySwatch: CustomColors.primarySwatchColor,
      scaffoldBackgroundColor: CustomColors.backgroundColor,
      primaryColor: CustomColors.primaryColor,
    );
  }
}
