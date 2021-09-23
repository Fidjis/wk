import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppDecoration {
  AppDecoration._();

  static const lightBlueDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFE3F4FE),
        Color(0xFFFEFEFF),
      ],
    ),
  );

  static const darkBlueDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF36A5FD),
        Color(0xFF0064C8),
      ],
    ),
  );

  static final actionButtonDecoration = BoxDecoration(
    color: AppColors.secondary,
    borderRadius: BorderRadius.circular(6),
  );
}
