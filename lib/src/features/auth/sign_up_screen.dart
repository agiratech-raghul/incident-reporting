import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_rich_text.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field%20copy.dart';
import 'package:incident_reporting/src/common_widgets/divider_child.dart';
import 'package:incident_reporting/src/common_widgets/google_facebook_widget.dart';
import 'package:incident_reporting/src/common_widgets/src/buttons/primary_button.dart';
import 'package:incident_reporting/src/packages/functions.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/utils/src/helpers/validator.dart';
import 'package:size_setter/size_setter.dart';

import '../../utils/src/colors/app_colors.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyTwo = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final phoneNumberController = TextEditingController();
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              const HeightSpaceBox(size: 30),
              const Align(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const HeightSpaceBox(size: 30),
              Form(
                key: _formKey,
                child: CommonTextFields(
                    // key: formKeys.first,
                    controller: nameController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    filled: true,
                    radius: 5,
                    floatingText: 'Full Name',
                    onChanged: (d) {
                      if (nameController.text.isNotEmpty) {
                        _formKey.currentState?.validate();
                        // return valida
                      }
                    },
                    validator: FormValidator.emptyValidator),
              ),
              const HeightSpaceBox(size: 15),
              Form(
                key: _formKeyTwo,
                child: CommonTextFields(
                  floatingText: 'Email Address',
                  controller: emailController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  filled: true,
                  radius: 5,
                  maxLines: 1,
                  onChanged: (d) {
                    _formKeyTwo.currentState?.validate();
                  },
                  validator: FormValidator.emailValidator,
                ),
              ),
              const HeightSpaceBox(size: 15),
              CommonTextFields(
                controller: phoneNumberController,
                hintText: 'Phone Number',
                floatingText: 'Phone Number',
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                filled: true,
                radius: 5,
                maxLines: 1,
                validator: (d) {
                  return null;

                  // return FormValidator.mobileNumberValidator(
                  //     d, int.parse(country!.first.phoneLength));
                },
              ),
              const HeightSpaceBox(size: 30),
              PrimaryButton(
                  isPrimary: true, onPressed: () async {}, text: 'sign up'),
              const DividerChild(text: 'or Sign Up with'),
              GoogleFacebook(googleOnpressed: () {}, facebookOnPressed: () {}),
              const HeightSpaceBox(size: 25),
              CommonRichText(
                firstText: 'Already have an account?',
                secondText: "Login",
                onPressed: () async {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteConstants.signInScreen,
                    (route) => true,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
