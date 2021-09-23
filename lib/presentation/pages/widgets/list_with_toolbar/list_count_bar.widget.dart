import 'package:flutter/material.dart';
import 'package:wk/utils/app_colors.dart';
import 'package:wk/utils/app_sizes.dart';
import 'package:wk/utils/app_texts.dart';

class ListCountBarWidget extends StatelessWidget {
  final String Function() translateCount;

  const ListCountBarWidget(this.translateCount);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPaddingSizes.normal,
        vertical: AppPaddingSizes.small,
      ),
      child: Text(translateCount(), style: AppTexts.subt2(color: AppColors.gray)),
    );
  }
}
