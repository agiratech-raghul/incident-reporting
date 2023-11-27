import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field%20copy.dart';
import 'package:incident_reporting/src/common_widgets/src/buttons/primary_button.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';
import 'package:incident_reporting/src/utils/src/helpers/validator.dart';
import 'package:size_setter/size_setter.dart';

class ForgotPassWord extends StatelessWidget {
  ForgotPassWord({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final numberController = TextEditingController();

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
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Utils.getScreenWidth(context, 23),
            horizontal: Utils.getScreenWidth(context, 23)),
        child: Column(children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Forgot Password",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const HeightSpaceBox(
            size: 25,
          ),
          Form(
            key: _formKey,
            child: CommonTextFields(
                // key: formKeys.first,
                controller: numberController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                filled: true,
                radius: 5,
                floatingText: 'phoneNumber',
                onChanged: (d) {
                  // if (numberController.text.isNotEmpty) {
                  //   _formKey.currentState?.validate();
                  //   // return valida
                  // }
                },
                validator: FormValidator.emptyValidator),
          ),
          const HeightSpaceBox(
            size: 30,
          ),
          PrimaryButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteConstants.otpVerification);
            },
            text: "Send",
            isPrimary: true,
          )
        ]),
      ),
    );
  }
}
