// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:size_setter/size_setter.dart';

import '../ui_utils/app_assets.dart';
import '../ui_utils/text_styles.dart';

class GoogleFacebook extends StatelessWidget {
  const GoogleFacebook({
    Key? key,
    required this.googleOnpressed,
    required this.facebookOnPressed,
  }) : super(key: key);
  final VoidCallback googleOnpressed;
  final VoidCallback facebookOnPressed;
  @override
  Widget build(BuildContext context) {
    log(context.screenWidth);
    log(context.screenHeight);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: Utils.getScreenWidth(context, 182),
          height: Utils.getScreenHeight(context, 50),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 5,
                  shadowColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: googleOnpressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppAssets.google,
                    width: 19,
                    height: 19,
                    fit: BoxFit.contain,
                  ),
                  const WidthSpaceBox(size: 10),
                  const Text(
                    'Google',
                    style: TextStyles.secondaryTextStyle,
                  ),
                ],
              )),
        ),
        SizedBox(
          width: Utils.getScreenWidth(context, 182),
          height: Utils.getScreenHeight(context, 50),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shadowColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: facebookOnPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppAssets.facebook,
                    width: 10,
                    height: 19,
                    fit: BoxFit.contain,
                  ),
                  const WidthSpaceBox(size: 10),
                  const Text('FaceBook', style: TextStyles.secondaryTextStyle),
                ],
              )),
        )
      ],
    );
  }
}
