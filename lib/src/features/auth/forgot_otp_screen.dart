import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field%20copy.dart';
import 'package:incident_reporting/src/common_widgets/src/buttons/primary_button.dart';
import 'package:incident_reporting/src/common_widgets/timer_widget.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/ui_utils/text_styles.dart';
import 'package:incident_reporting/src/utils/appUtils.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';
import 'package:incident_reporting/src/utils/src/helpers/ui_dimens.dart';
import 'package:incident_reporting/src/utils/src/helpers/validator.dart';
import 'package:size_setter/size_setter.dart';

class ForgotOtpScreen extends StatefulWidget {
  const ForgotOtpScreen({super.key});

  @override
  State<ForgotOtpScreen> createState() => _ForgotOtpScreenState();
}

class _ForgotOtpScreenState extends State<ForgotOtpScreen> {
  String? randomCaptcha = '';
  @override
  void initState() {
    super.initState();
    recaptcha(length: 5);
  }

  String? recaptcha({int? length}) {
    setState(() {
      randomCaptcha = AppUtils.getRandomCaptcha(length ?? 5);
    });
    return randomCaptcha;
  }

  @override
  Widget build(BuildContext context) {
    final captchaController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.appScaffoldColor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: const Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.black),
          )),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(Utils.getspFontSize(context, 30)),
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'OTP Verification',
                style: TextStyles.otpVerifyTextStyle
                    .copyWith(fontSize: Utils.getspFontSize(context, 26)),
              ),
            ),
            const HeightSpaceBox(size: 30),
            SizedBox(
              width: double.infinity,
              child: FittedBox(
                child: OtpTextField(
                  numberOfFields: 6,
                  borderColor: const Color(0xFF512DA8),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        });
                  },
                ),
              ),
            ),
            const HeightSpaceBox(size: UIDimens.size25),
            TimerWidget(
              onTap: () async {},
            ),
            const HeightSpaceBox(size: 30),
            PrimaryButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteConstants.restPassword);
              },
              text: "Verify",
              isPrimary: true,
            ),
            const HeightSpaceBox(size: UIDimens.size10),
          ],
        ),
      ),
    );
  }
}
