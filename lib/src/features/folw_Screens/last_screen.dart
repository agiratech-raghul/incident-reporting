import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/commonOptionsContainers.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_yes_or_no.dart';

class LastScreen extends StatelessWidget {
  const LastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonScaffold(
      title: "Step 7",
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ExpansionTile(
          title: Text("Weather Conditions"),
          childrenPadding: EdgeInsets.all(10),
          children: [
            CommonOptionsContainers(
              option1: "☀️",
              optionName1: "Sunny",
              option2: "🌧️",
              optionName2: "Rainy",
              option3: "❄️",
              optionName3: "Snow",
            )
          ],
        ),
        ExpansionTile(
          title: Text("Road Conditions"),
          childrenPadding: EdgeInsets.all(10),
          children: [
            CommonOptionsContainers(
              option1: "🛣️",
              optionName1: "Normal Road",
              option2: "⛐",
              optionName2: "Slippery Road",
              option3: "🚧",
              optionName3: "Construction",
              option4: "🕳️",
              optionName4: "Pot hole",
            )
          ],
        ),
        ExpansionTile(
          title: Text("Traffic Conditions"),
          childrenPadding: EdgeInsets.all(10),
          children: [
            CommonOptionsContainers(
              option1: "🛑",
              optionName1: "Stop Sign",
              option2: "🏮",
              optionName2: "Red Light",
              option3: "⛙",
              optionName3: "Merge",
              option4: "🚷",
              optionName4: "Stop Sign",
            )
          ],
        ),
        ExpansionTile(
          title: Text("Telematics - Dongle(s) for any vehicle"),
          trailing: SizedBox(
            width: 140,
            child: CommonYesOrNo(),
          ),
          childrenPadding: EdgeInsets.all(10),
          children: [
            TextField(
              decoration:
                  InputDecoration(label: Text("List Names if Possible")),
            ),
          ],
        ),
        ExpansionTile(
          title: Text("Dash Cam/Video"),
          trailing: SizedBox(
            width: 140,
            child: CommonYesOrNo(),
          ),
          childrenPadding: EdgeInsets.all(10),
          children: [
            TextField(
              enabled: false,
              decoration:
                  InputDecoration(label: Text("Please Attach If available")),
            ),
          ],
        ),
        // ElevatedButton(onPressed: () {}, child: const Text("data"))
      ]),
    );
  }
}
