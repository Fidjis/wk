import 'package:flutter/material.dart';
import 'package:wk/utils/app_sizes.dart';

class SpacingWidget extends StatelessWidget {
  final double size;

  factory SpacingWidget.extraSmall() {
    return const SpacingWidget._(size: AppSpacingSizes.xsmall);
  }

  factory SpacingWidget.small() {
    return const SpacingWidget._(size: AppSpacingSizes.small);
  }

  factory SpacingWidget.normal() {
    return const SpacingWidget._(size: AppSpacingSizes.normal);
  }

  const SpacingWidget._({
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
    );
  }
}
