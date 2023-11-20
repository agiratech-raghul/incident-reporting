import 'dart:io';

import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_image_picker.dart';
import 'package:incident_reporting/src/common_widgets/src/video_player.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Create New Incedent "),
              onPressed: () {
                Navigator.of(context).pushNamed(RouteConstants.initialScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
