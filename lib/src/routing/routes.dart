import 'package:incident_reporting/src/features/folw_Screens/first_screen.dart';
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
      case RouteConstants.secondScreen:
        bool? isAnotherVehicles = data["isAnotherVehicle"] ?? false;
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.secondScreen),
            builder: (context) =>
                ThirdScreen(isAnotherVehicle: isAnotherVehicles));
      case RouteConstants.newSecondScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.newSecondScreen),
            builder: (context) => const SecondScreen());
      case RouteConstants.profileScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.profileScreen),
            builder: (context) => const ProfileScreen());
      case RouteConstants.otherInfoScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.otherInfoScreen),
            builder: (context) => const OtherInfoScreen());
      default:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.splashScreen),
            builder: (context) => const SplashScreen());
    }
  }
}

RouteFactory get onGenerateRoute => RouteManager().route;
