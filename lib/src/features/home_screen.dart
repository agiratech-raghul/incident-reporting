import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/common_widgets/signature_pad.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Uint8List? signatureImage;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: "Incident Report",
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (signatureImage != null)
            Image.memory(
              signatureImage!,
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
          TextButton(
            onPressed: () async {
              signatureImage = await showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  content: SignatureScreen(),
                  contentPadding: EdgeInsets.zero,
                ),
              );
              setState(() {});
            },
            child: Text(
              signatureImage != null
                  ? 'Change Your Signature'
                  : 'Add Your Signature',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          ElevatedButton(
            child: const Text("Create New Incident "),
            onPressed: () async {
              Navigator.of(context).pushNamed(RouteConstants.initialScreen);
            },
          ),
        ],
      )),
    );
  }
}
