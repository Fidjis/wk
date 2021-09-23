import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTexts {
  static const TextStyle h1 = TextStyle(
    fontSize: 60.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle h2 = TextStyle(
    fontSize: 48.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle h3 = TextStyle(
    fontSize: 34.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h4({FontWeight? weigth, Color? color}) => TextStyle(
        fontSize: 28.0,
        fontWeight: weigth ?? FontWeight.bold,
        color: color ?? AppColors.black,
      );

  static const TextStyle h5 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h6({FontWeight? weigth, Color? color}) => TextStyle(
        fontSize: 20.0,
        fontWeight: weigth ?? FontWeight.bold,
        color: color ?? AppColors.black,
      );

  static TextStyle subt1({FontWeight? weigth, Color? color}) => TextStyle(
        fontSize: 16.0,
        fontWeight: weigth ?? FontWeight.w300,
        color: color ?? AppColors.black,
      );

  static TextStyle subt2({FontWeight? weigth, Color? color}) => TextStyle(
        fontSize: 14.0,
        fontWeight: weigth ?? FontWeight.w300,
        color: color ?? AppColors.black,
      );
}
