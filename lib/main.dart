import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'src/app.dart';
import 'src/services/services_initializer.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {

  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(DevicePreview(
      enabled: false,
      builder: (context) => const App(),
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('An error occurred'),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    debugPrint(error.toString());
  });
}
