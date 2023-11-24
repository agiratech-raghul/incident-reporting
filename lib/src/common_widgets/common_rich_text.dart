// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:incident_reporting/src/ui_utils/text_styles.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';

class CommonRichText extends StatelessWidget {
  const CommonRichText({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.onPressed,
    this.firstStyle,
    this.rightAlignment = false,
    this.secondStyle,
    this.alignment,
    this.width,
  }) : super(key: key);
  final String firstText;
  final String secondText;
  final TextStyle? firstStyle;
  final TextStyle? secondStyle;
  final double? width;
  final VoidCallback onPressed;
  final bool rightAlignment;
  final Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment == null
          ? rightAlignment
              ? Alignment.centerRight
              : Alignment.center
          : alignment!,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: firstText,
          style: firstStyle ??
              TextStyles.regularText
                  .copyWith(color: AppColors.primaryTextColor),
        ),
        WidgetSpan(
            child: SizedBox(
          width: width ?? 10,
        )),
        TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onPressed,
            text: secondText,
            style: secondStyle ?? TextStyles.regularTextSecondary)
      ])),
    );
  }
}
