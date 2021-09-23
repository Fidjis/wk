import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_sizes.dart';
import 'app_texts.dart';

abstract class AppButtonStyle {
  AppButtonStyle._();

  static ButtonStyle primary = ElevatedButton.styleFrom(
    primary: AppColors.primary,
  );

  static ButtonStyle secondary = ElevatedButton.styleFrom(
    primary: AppColors.secondary,
    textStyle: AppTexts.subt1(color: AppColors.white),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.button),
    ),
  );

  static ButtonStyle modalAction = ElevatedButton.styleFrom(
    primary: AppColors.primary,
    textStyle: AppTexts.subt1(color: AppColors.secondary),
    shadowColor: Colors.transparent,
  );
}
