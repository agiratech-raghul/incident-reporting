import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_expansion_tile.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_yes_or_no.dart';
import 'package:size_setter/size_setter.dart';

import '../../common_widgets/signature_pad.dart';
import '../../ui_utils/app_assets.dart';

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
    return const CommonScaffold(
      isFlow: true,
      title: "Step 7",
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CommonExpansionCard(
            title: "Telematics - Dongle(s) for any vehicle",
            trailing: SizedBox(
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
            trailing: SizedBox(
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
            trailing: SizedBox(
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
            trailing: SizedBox(
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
            trailing: SizedBox(
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
            trailing: SizedBox(
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
            trailing: SizedBox(
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
            trailing: SizedBox(
              width: 140,
              child: CommonYesOrNo(),
            ),
            widget: CommonTextField(
              hintText: "List Names if Possible",
              border: InputBorder.none,
              horizontal: 20.w,
            ),
          ),
          // ElevatedButton(onPressed: () {}, child: const Text("data"))
        ]),
      ),
    );
  }
}
