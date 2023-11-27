import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field%20copy.dart';
import 'package:incident_reporting/src/common_widgets/src/buttons/primary_button.dart';
import 'package:incident_reporting/src/utils/src/helpers/validator.dart';
import 'package:size_setter/size_setter.dart';

import '../../routing/route_constants.dart';
import '../../utils/src/colors/app_colors.dart';

class RestPassword extends StatelessWidget {
  RestPassword({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyTwo = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeightSpaceBox(size: 30),
            const Align(
              child: Text(
                "Rest Password",
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
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  filled: true,
                  radius: 5,
                  floatingText: 'New password',
                  onChanged: (d) {
                    if (passwordController.text.isNotEmpty) {
                      _formKey.currentState?.validate();
                      // return valida
                    }
                  },
                  validator: FormValidator.passwordValidator),
            ),
            const HeightSpaceBox(size: 15),
            Form(
              key: _formKeyTwo,
              child: CommonTextFields(
                floatingText: 'Confirm password',
                controller: confirmPasswordController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                filled: true,
                radius: 5,
                maxLines: 1,
                onChanged: (d) {
                  _formKeyTwo.currentState?.validate();
                },
                validator: (value) {
                  FormValidator.confirmPasswordValidator(
                      value, passwordController.text);
                  return null;
                },
              ),
            ),
            const HeightSpaceBox(size: 30),
            PrimaryButton(
                isPrimary: true,
                onPressed: () async {
                  Navigator.pushNamed(context, RouteConstants.homeScreen);
                },
                text: 'Change password'),
          ],
        ),
      ),
    );
  }
}
