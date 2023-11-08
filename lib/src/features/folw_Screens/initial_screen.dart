import 'package:flutter/material.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/map_widget.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(children: [MapScreen()]),
      ),
    );
  }
}
