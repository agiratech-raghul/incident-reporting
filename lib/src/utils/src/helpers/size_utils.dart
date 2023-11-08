// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:incident_reporting/src/utils/src/extensions/size_extension.dart';

class WidthSpaceBox extends StatefulWidget {
  const WidthSpaceBox({Key? key, required this.size}) : super(key: key);
  final double size;
  @override
  State<WidthSpaceBox> createState() => _WidthSpaceBoxState();
}

class _WidthSpaceBoxState extends State<WidthSpaceBox> {
  @override
  Widget build(BuildContext context) {
    return Utils.getWidth(context.screenWidth, widget.size).widthBox;
  }
}

class HeightSpaceBox extends StatefulWidget {
  const HeightSpaceBox({
    Key? key,
    required this.size,
  }) : super(key: key);
  final double size;
  @override
  State<HeightSpaceBox> createState() => _HeightSpaceBoxState();
}

class _HeightSpaceBoxState extends State<HeightSpaceBox> {
  @override
  Widget build(BuildContext context) {
    return Utils.getHeight(context.screenHeight, widget.size).heightBox;
  }
}

abstract class Utils {
  static BuildContext? contexts;
  static setSize(BuildContext context) {
    contexts = context;
  }

  static double getScreenWidth(BuildContext context, double y) {
    log(" Madhan${contexts.toString()}");
    return contexts!.screenWidth * (y / 430.0);
  }

  static double getScreenHeight(BuildContext context, double y) {
    return contexts!.screenHeight * (y / 932.0);
  }

  static double getWidth(double x, double y) {
    return x * (y / 430.0);
  }

  static double getHeight(double x, double y) {
    return x * (y / 932.0);
  }

  static double getEvenSize(double z, BuildContext? context) {
    return (context!.screenWidth * context.screenHeight) * (z / (430 * 932));
  }

  static double getFontSize(
      BuildContext context,
      double referenceFontSize,
      ) {
    // Calculate scaling factors for width and height
    double widthScaleFactor = context.screenWidth / 430;
    double heightScaleFactor = context.screenHeight / 932;

    // Choose the smaller scaling factor to ensure the text fits within both dimensions
    double scaleFactor = widthScaleFactor < heightScaleFactor
        ? widthScaleFactor
        : heightScaleFactor;

    // Calculate the dynamic font size
    double dynamicFontSize = referenceFontSize * scaleFactor;

    return dynamicFontSize;
  }
}


// class Responsive extends StatelessWidget {
//   const Responsive({
//     Key? key,
//     required this.context,
//   }) : super(key: key);
//   final BuildContext context;
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
