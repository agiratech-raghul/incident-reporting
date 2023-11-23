import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_expansion_tile.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_yes_or_no.dart';
import 'package:size_setter/size_setter.dart';

class LastScreen extends StatelessWidget {
  const LastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  CommonScaffold(
      isFlow: true,
      title: "Step 7",
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
          // ElevatedButton(onPressed: () {}, child: const Text("data"))
        ]),
      ),
    );
  }
}
