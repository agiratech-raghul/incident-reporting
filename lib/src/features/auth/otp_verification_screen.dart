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

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
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
          title: Center(
            child: Image.asset(
              AppAssets.appLogo,
              height: Utils.getScreenHeight(context, 50),
              fit: BoxFit.fitHeight,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Utils.getspFontSize(context, 30)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OTP Verification',
                  style: TextStyles.otpVerifyTextStyle
                      .copyWith(fontSize: Utils.getspFontSize(context, 26)),
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
                                content:
                                    Text('Code entered is $verificationCode'),
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height:
                              Utils.getScreenHeight(context, UIDimens.size80),
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.lightGrey,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: Text(
                            randomCaptcha ?? "",
                            style: TextStyles.captchaStyle,
                          )),
                    ),
                    const WidthSpaceBox(size: 10),
                    InkWell(
                      onTap: () {
                        recaptcha(length: 5);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          height:
                              Utils.getScreenHeight(context, UIDimens.size80),
                          width: Utils.getScreenWidth(context, UIDimens.size55),
                          decoration: const BoxDecoration(
                              color: AppColors.checkboxColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(UIDimens.size5))),
                          child: const Image(
                            image: AssetImage(AppAssets.captcha),
                            fit: BoxFit.scaleDown,
                          )),
                    ),
                  ],
                ),
                const HeightSpaceBox(size: 15),
                CommonTextFields(
                  controller: captchaController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  filled: true,
                  radius: 5,
                  maxLength: 5,
                  maxLines: 1,
                  onChanged: (d) {},
                  hintText: "Enter Captcha",
                  validator: FormValidator.emptyValidator,
                ),
                const HeightSpaceBox(size: 25),
                PrimaryButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteConstants.homeScreen);
                  },
                  text: "Verify",
                  isPrimary: true,
                ),
                const HeightSpaceBox(size: UIDimens.size10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
