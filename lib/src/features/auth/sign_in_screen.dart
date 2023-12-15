import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_rich_text.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field%20copy.dart';
import 'package:incident_reporting/src/common_widgets/divider_child.dart';
import 'package:incident_reporting/src/common_widgets/google_facebook_widget.dart';
import 'package:incident_reporting/src/common_widgets/src/buttons/primary_button.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/utils/src/helpers/validator.dart';
import 'package:size_setter/size_setter.dart';

import '../../routing/route_constants.dart';
import '../../ui_utils/text_styles.dart';
import '../../utils/src/colors/app_colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyTwo = GlobalKey<FormState>();
  late AnimationController controller;
  late AnimationController controller1;

  late Animation<double> fadeOutAnimation;
  late Animation<Offset> slideOutAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..forward();
    controller1 =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..forward();

    fadeOutAnimation = CurvedAnimation(parent: controller, curve: Curves.ease);
    slideOutAnimation =
        Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(CurvedAnimation(parent: controller1, curve: Curves.ease));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.appScaffoldColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: controller.value,
                      child: FadeTransition(
                        opacity: fadeOutAnimation,
                        child: Image.asset(
                          AppAssets.appLogo,
                          height: Utils.getScreenHeight(context, 100),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    );
                  }),
              const HeightSpaceBox(size: 30),
              SlideTransition(
                position: slideOutAnimation,
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: CommonTextFields(
                          // key: formKeys.first,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          filled: true,
                          radius: 5,
                          floatingText: 'Email address',
                          onChanged: (d) {
                            if (emailController.text.isNotEmpty) {
                              _formKey.currentState?.validate();
                              // return valida
                            }
                          },
                          validator: FormValidator.emailValidator),
                    ),
                    const HeightSpaceBox(size: 15),
                    Form(
                      key: _formKeyTwo,
                      child: CommonTextFields(
                        floatingText: 'Password',
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        filled: true,
                        radius: 5,
                        maxLines: 1,
                        onChanged: (d) {
                          _formKeyTwo.currentState?.validate();
                        },
                        validator: FormValidator.passwordValidator,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteConstants.forgotPassword);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.centerRight,
                        child: Text('Forget Password? ',
                            style: TextStyles.regularTextSecondary
                                .copyWith(color: AppColors.primaryColor)),
                      ),
                    ),
                    PrimaryButton(
                        isPrimary: true,
                        onPressed: () async {
                          Navigator.pushNamed(
                              context, RouteConstants.homeScreen);
                        },
                        text: 'Login'),
                    const DividerChild(text: 'Or Login With'),
                    GoogleFacebook(
                        googleOnpressed: () {}, facebookOnPressed: () {}),
                    const HeightSpaceBox(size: 25),
                    CommonRichText(
                      firstText: 'dont have an account',
                      secondText: "Sign Up",
                      onPressed: () async {
                        Navigator.of(context)
                            .pushNamed(RouteConstants.signUpScreen);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
