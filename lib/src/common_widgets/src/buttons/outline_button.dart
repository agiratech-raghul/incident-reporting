 import 'package:flutter/material.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, this.text, this.onPressed});
  final String? text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(text!,style: TextStyle(color: Colors.black),textAlign: TextAlign.center),
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: AppColors.primaryColor,width: 1)
                )
            )
        )
    );
  }
}