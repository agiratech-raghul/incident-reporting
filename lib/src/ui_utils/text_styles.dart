import 'package:flutter/material.dart';
import 'package:incident_reporting/src/utils/src/helpers/ui_dimens.dart';

abstract class TextStyles {
  static const midTextWhite = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: UIDimens.size14, //Utils.getFontSize(context, 30)
  );

  static const regularTextWhite = TextStyle(
    color: Colors.white,
    fontSize: UIDimens.size14, //Utils.getFontSize(context, 30)
  );
}