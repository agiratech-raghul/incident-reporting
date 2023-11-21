import 'package:flutter/material.dart';
import 'package:incident_reporting/src/ui_utils/text_styles.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';
import 'package:incident_reporting/src/utils/src/helpers/size_utils.dart';
import 'package:incident_reporting/src/utils/src/helpers/ui_dimens.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
        this.color,
        required this.onPressed,
        required this.text,
        this.isPrimary,
        this.margin,
        this.padding,
        this.changeTextStyle = false,
        this.width,
        this.height,
        this.isgrey = false});
  final Color? color;
  final bool isgrey;
  final bool? isPrimary;
  final bool? changeTextStyle;
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    // Banner(message: message, location: location)

    return Container(
      margin: margin,
      height: height ?? Utils.getScreenHeight(context, UIDimens.size60),
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: padding,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: isgrey
                ? const Color(0xffEAECF4)
                : isPrimary == true
                ? AppColors.primaryColor
                : AppColors.lightBlue,
            foregroundColor: isgrey ? AppColors.primaryColor : Colors.white,
            textStyle: changeTextStyle!
                ? TextStyles.midTextWhite
                .copyWith(fontSize: Utils.getFontSize(context, 16))
                : TextStyles.regularTextWhite
                .copyWith(fontSize: Utils.getFontSize(context, 16))),
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}