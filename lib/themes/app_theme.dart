import 'package:flutter/material.dart';

import 'package:news_app/themes/app_colors.dart';

class Apptheme {
  ThemeData apptheme() {
    return ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.appBarBackgroundColor,
          centerTitle: true,
          elevation: 0,
        ),
        primarySwatch: AppColors.primarySwatchColor,
        canvasColor: AppColors.canvasColor);
  }
}
