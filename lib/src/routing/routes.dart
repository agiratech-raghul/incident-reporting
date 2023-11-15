import 'package:incident_reporting/src/features/folw_Screens/initial_screen.dart';
import 'package:incident_reporting/src/features/folw_Screens/profile_screen.dart';
import 'package:incident_reporting/src/features/folw_Screens/seccond_screen.dart';
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
            builder: (context) => const InitialScreen());
      case RouteConstants.secondScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.initialScreen),
            builder: (context) => const SecondScreen());
      case RouteConstants.profileScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.initialScreen),
            builder: (context) => const ProfileScreen());
      default:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.splashScreen),
            builder: (context) => const SplashScreen());
    }
  }
}

RouteFactory get onGenerateRoute => RouteManager().route;
