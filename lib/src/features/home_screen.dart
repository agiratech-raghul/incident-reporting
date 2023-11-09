import 'package:flutter/material.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text("Create New Incedent "),
        onPressed: () {
          Navigator.of(context).pushNamed(RouteConstants.initialScreen);
        },
      )),
    );
  }
}
