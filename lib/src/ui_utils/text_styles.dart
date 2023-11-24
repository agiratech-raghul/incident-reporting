import 'package:flutter/material.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';
import 'package:incident_reporting/src/utils/src/helpers/ui_dimens.dart';

abstract class TextStyles {
  static const midTextWhite = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: UIDimens.size14, //Utils.getFontSize(context, 30)
  );
  static const regularText = TextStyle(
    color: AppColors.primaryColor,
    fontSize: UIDimens.size14, //Utils.getFontSize(context, 30)
  );
  static const secondaryTextStyle = TextStyle(
    fontSize: UIDimens.size14,
    color: AppColors.secondarytextColor,
  );
  static const regularTextSecondary = TextStyle(
    color: AppColors.lightBlue,
    fontSize: UIDimens.size14, //Utils.getFontSize(context, 30)
  );
  static const regularTextWhite = TextStyle(
    color: Colors.white,
    fontSize: UIDimens.size14, //Utils.getFontSize(context, 30)
  );
}
