import 'package:incident_reporting/src/features/auth/sign_in_screen.dart';
import 'package:incident_reporting/src/features/auth/sign_up_screen.dart';
import 'package:incident_reporting/src/features/folw_Screens/first_screen.dart';
import 'package:incident_reporting/src/features/folw_Screens/last_screen.dart';
import 'package:incident_reporting/src/features/folw_Screens/second_screen.dart';
import 'package:incident_reporting/src/features/folw_Screens/other_details.dart';
import 'package:incident_reporting/src/features/folw_Screens/profile_screen.dart';
import 'package:incident_reporting/src/features/folw_Screens/third_screen.dart';
import 'package:incident_reporting/src/features/home_screen.dart';

import '../../src/routing/route_constants.dart';
import 'package:flutter/material.dart';

import '../features/splash/screen/splash_screen.dart';

class RouteManager {
  MaterialPageRoute<dynamic> route(RouteSettings settings) {
    dynamic data = settings.arguments != null ? settings.arguments ?? {} : {};

    switch (settings.name) {
      case RouteConstants.splashScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.splashScreen),
            builder: (context) => const SplashScreen());
      case RouteConstants.homeScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.homeScreen),
            builder: (context) => const HomeScreen());
      case RouteConstants.initialScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.initialScreen),
            builder: (context) => const FirstScreen());
      case RouteConstants.thirdScreen:
        bool? isAnotherVehicles = data["isAnotherVehicle"] ?? false;
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.thirdScreen),
            builder: (context) =>
                ThirdScreen(isAnotherVehicle: isAnotherVehicles));
      case RouteConstants.secondScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.secondScreen),
            builder: (context) => const SecondScreen());
      case RouteConstants.profileScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.profileScreen),
            builder: (context) => const ProfileScreen());
      case RouteConstants.otherInfoScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.otherInfoScreen),
            builder: (context) => const OtherInfoScreen());
      case RouteConstants.lastScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.lastScreen),
            builder: (context) => const LastScreen());
      case RouteConstants.signInScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.signInScreen),
            builder: (context) => SignInScreen());
      case RouteConstants.signUpScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.signUpScreen),
            builder: (context) => SignUpScreen());
      default:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.splashScreen),
            builder: (context) => const SplashScreen());
    }
  }
}

RouteFactory get onGenerateRoute => RouteManager().route;
