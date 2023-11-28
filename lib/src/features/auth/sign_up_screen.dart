import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_rich_text.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field%20copy.dart';
import 'package:incident_reporting/src/common_widgets/divider_child.dart';
import 'package:incident_reporting/src/common_widgets/google_facebook_widget.dart';
import 'package:incident_reporting/src/common_widgets/src/buttons/primary_button.dart';
import 'package:incident_reporting/src/packages/functions.dart';
import 'package:incident_reporting/src/providers/app_providers.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/ui_utils/fonts.dart';
import 'package:incident_reporting/src/utils/src/helpers/ui_dimens.dart';
import 'package:incident_reporting/src/utils/src/helpers/validator.dart';
import 'package:size_setter/size_setter.dart';

import '../../utils/src/colors/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AppProvider _controller = AppProvider();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
      _controller.getCountries();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

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
          child: Form(
            key: _formKey,
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
                CommonTextFields(
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
                const HeightSpaceBox(size: 15),
                CommonTextFields(
                  floatingText: 'Email Address',
                  controller: emailController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  filled: true,
                  radius: 5,
                  maxLines: 1,
                  onChanged: (d) {
                    _formKey.currentState?.validate();
                  },
                  validator: FormValidator.emailValidator,
                ),
                const HeightSpaceBox(size: 15),
                CommonTextFields(
                  controller: phoneNumberController,
                  hintText: 'Phone Number',
                  floatingText: 'Phone Number',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  filled: true,
                  prefix: GestureDetector(
                    onTap: () async {
                      print("object");
                      final country = await showCountryPickerSheet(
                        context,
                      );
                      if (country != null) {
                        _controller.changeContryCode(country.id);
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const WidthSpaceBox(size: 5),
                        Image.asset(
                          (_controller.country == null ||
                                  _controller.country!.isEmpty)
                              ? "assets/flags/usa.png"
                              : _controller.country!.first.flag,
                          // package: countryCodePackageName,
                          width: 30,
                          // fit: BoxFit.fitWidth,
                        ),
                        const WidthSpaceBox(size: 5),
                        Text(
                          '${_controller.country?.first.phone}',
                          style: const TextStyle(
                            fontFamily: Fonts.medium,
                            fontSize: UIDimens.size17,
                          ),
                        ),
                        const WidthSpaceBox(size: 5),
                        Container(
                          width: 0.5,
                          height: Utils.getScreenHeight(context, 45),
                          color: AppColors.commonIconColor,
                        ),
                        const WidthSpaceBox(size: 5),
                        const WidthSpaceBox(size: 5),
                      ],
                    ),
                  ),
                  radius: 5,
                  maxLines: 1,
                  validator: (d) {
                    return FormValidator.mobileNumberValidator(
                        d, int.parse(_controller.country!.first.phoneLength));
                  },
                ),
                const HeightSpaceBox(size: 15),
                CommonTextFields(
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
                const HeightSpaceBox(size: 15),
                CommonTextFields(
                  floatingText: 'Confirm password',
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  filled: true,
                  radius: 5,
                  maxLines: 1,
                  onChanged: (d) {
                    _formKey.currentState?.validate();
                  },
                  validator: (value) {
                    FormValidator.confirmPasswordValidator(
                        value, passwordController.text);
                    return null;
                  },
                ),
                const HeightSpaceBox(size: 30),
                PrimaryButton(
                    isPrimary: true,
                    onPressed: () async {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteConstants.otpVerification,
                        (route) => true,
                      );
                    },
                    text: 'sign up'),
                const DividerChild(text: 'or Sign Up with'),
                GoogleFacebook(
                    googleOnpressed: () {}, facebookOnPressed: () {}),
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
      ),
    );
  }
}
