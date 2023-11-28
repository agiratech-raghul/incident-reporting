import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field%20copy.dart';
import 'package:incident_reporting/src/common_widgets/src/buttons/primary_button.dart';
import 'package:incident_reporting/src/packages/functions.dart';
import 'package:incident_reporting/src/providers/app_providers.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/ui_utils/fonts.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';
import 'package:incident_reporting/src/utils/src/helpers/ui_dimens.dart';
import 'package:incident_reporting/src/utils/src/helpers/validator.dart';
import 'package:size_setter/size_setter.dart';

class ForgotPassWord extends StatefulWidget {
  const ForgotPassWord({super.key});

  @override
  State<ForgotPassWord> createState() => _ForgotPassWordState();
}

class _ForgotPassWordState extends State<ForgotPassWord> {
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
          const HeightSpaceBox(
            size: 30,
          ),
          PrimaryButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteConstants.forgotOtpScreen);
            },
            text: "Send",
            isPrimary: true,
          )
        ]),
      ),
    );
  }
}
