import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_expansion_tile.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_yes_or_no.dart';
import 'package:size_setter/size_setter.dart';
import '../../common_widgets/signature_pad.dart';

class LastScreen extends StatefulWidget {
  const LastScreen({super.key});

  @override
  State<LastScreen> createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
  Uint8List? signatureImage;
  File? videoData;
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isFlow: true,
      title: "Step 7",
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CommonExpansionCard(
            title: "Telematics - Dongle(s) for any vehicle",
            trailing: const SizedBox(
              width: 140,
              child: CommonYesOrNo(),
            ),
            widget: CommonTextField(
              labelText: "List Names if Possible",
              hintText: "List Names if Possible",
              border: InputBorder.none,
              horizontal: 20.w,
            ),
          ),
          CommonExpansionCard(
            title: "Dash Cam/Video",
            trailing: const SizedBox(
              width: 140,
              child: CommonYesOrNo(),
            ),
            widget: CommonTextField(
              enabled: true,
              hintText: "Please Attach If available",
              border: InputBorder.none,
              horizontal: 20.w,
            ),
          ),
          CommonExpansionCard(
            title: "Points of impact (Insured Vehicle / Adverse Vehicle",
            trailing: const SizedBox(
              width: 140,
              child: CommonYesOrNo(),
            ),
            widget: CommonTextField(
              hintText: "List Names if Possible",
              border: InputBorder.none,
              horizontal: 20.w,
            ),
          ),
          CommonExpansionCard(
            title: "Did any of the airbags deploy for any vehicle",
            trailing: const SizedBox(
              width: 140,
              child: CommonYesOrNo(),
            ),
            widget: CommonTextField(
              hintText: "List Names if Possible",
              border: InputBorder.none,
              horizontal: 20.w,
            ),
          ),
          CommonExpansionCard(
            title: "Speed limit of each Vehicle if known",
            trailing: const SizedBox(
              width: 140,
              child: CommonYesOrNo(),
            ),
            widget: CommonTextField(
              hintText: "List Names if Possible",
              border: InputBorder.none,
              horizontal: 20.w,
            ),
          ),
          CommonExpansionCard(
            title: "Was any vehicle in the accident stolen",
            trailing: const SizedBox(
              width: 140,
              child: CommonYesOrNo(),
            ),
            widget: CommonTextField(
              hintText: "List Names if Possible",
              border: InputBorder.none,
              horizontal: 20.w,
            ),
          ),
          CommonExpansionCard(
            title: "Mechanical Failure of any vehicle in the accident",
            trailing: const SizedBox(
              width: 140,
              child: CommonYesOrNo(),
            ),
            widget: CommonTextField(
              hintText: "List Names if Possible",
              border: InputBorder.none,
              horizontal: 20.w,
            ),
          ),
          CommonExpansionCard(
            title: "Was any vehicle in the accident towed",
            trailing: const SizedBox(
              width: 140,
              child: CommonYesOrNo(),
            ),
            widget: CommonTextField(
              hintText: "List Names if Possible",
              border: InputBorder.none,
              horizontal: 20.w,
            ),
          ),
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
          // ElevatedButton(onPressed: () {}, child: const Text("data"))
        ]),
      ),
    );
  }
}
