import 'package:flutter/material.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';

class CommonIndicator extends CircularProgressIndicator {
  const CommonIndicator(
      {super.key, this.value, this.strokeWidth = 4.0, this.backgroundColor});
  final double? value;
  @override
  final double strokeWidth;
  @override
  final Color? backgroundColor;
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppColors.primaryColor,
      backgroundColor: backgroundColor,
      value: value,
      strokeWidth: strokeWidth,
    );
  }
}
