import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/commonOptionsContainers.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_yes_or_no.dart';

class OtherInfoScreen extends StatefulWidget {
  const OtherInfoScreen({super.key});

  @override
  State<OtherInfoScreen> createState() => _OtherInfoScreenState();
}

class _OtherInfoScreenState extends State<OtherInfoScreen> {


  String dropDownValue = 'Ola';

  var items = [
    'Ola',
    'Uber',
    'Rapido',
    'Lyft',
    'Grab Cabs',
    'Others'
  ];
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: "Step 6",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
          child: Column(
            children: [
              const ExpansionTile(
                title: Text("Ambulance/was any party sent to ER"),trailing: SizedBox(
                width: 140,
                child: CommonYesOrNo(),
              ),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  TextField(
                    decoration: InputDecoration(
                        label: Text("List names if Possible")
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text("Witness – if yes Contact information"),trailing: SizedBox(
                width: 140,
                child: CommonYesOrNo(),
              ),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  TextField(
                    decoration: InputDecoration(
                        label: Text("List Names if Possible")
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text("Were there any Minors"),trailing: SizedBox(
                width: 140,
                child: CommonYesOrNo(),
              ),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  TextField(
                    decoration: InputDecoration(
                        label: Text("List Names and Age if possible")
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text("Any Criminal acts by Adverse"),trailing: SizedBox(
                width: 140,
                child: CommonYesOrNo(),
              ),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  TextField(
                    decoration: InputDecoration(
                        label: Text("Enter a Brief Information about it")
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text("Was a TNC company involved with the accident"),trailing: const SizedBox(
                width: 140,
                child: CommonYesOrNo(),
              ),
                childrenPadding: const EdgeInsets.all(10),
                children: [
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: DropdownButton(
                          value: dropDownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          },
                        ),
                      ),
                      if(dropDownValue == "Others")const Expanded(child: TextField())
                    ],
                  ),
                ],
              ),
              const ExpansionTile(
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
              const ExpansionTile(
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
              const ExpansionTile(
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
              const ExpansionTile(
                title: Text("Telematics - Dongle(s) for any vehicle"),trailing: SizedBox(
                width: 140,
                child: CommonYesOrNo(),
              ),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  TextField(
                    decoration: InputDecoration(
                        label: Text("List Names if Possible")
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text("Dash Cam/Video"),trailing: SizedBox(
                width: 140,
                child: CommonYesOrNo(),
              ),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  TextField(
                    enabled:false,
                    decoration: InputDecoration(
                        label: Text("Please Attach If available")
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text("Points of impact (Insured Vehicle / Adverse Vehicle)"),trailing: SizedBox(
                width: 140,
                child: CommonYesOrNo(),
              ),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  TextField(
                    decoration: InputDecoration(
                        label: Text("List Names if Possible")
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text("Did any of the airbags deploy for any vehicle"),trailing: SizedBox(
                width: 140,
                child: CommonYesOrNo(),
              ),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  TextField(
                    decoration: InputDecoration(
                        label: Text("List Names if Possible")
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text("Speed limit of each Vehicle if known"),trailing: SizedBox(
                width: 140,
                child: CommonYesOrNo(),
              ),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  TextField(
                    decoration: InputDecoration(
                        label: Text("List Names if Possible")
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text("Was any vehicle in the accident stolen"),trailing: SizedBox(
                width: 140,
                child: CommonYesOrNo(),
              ),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  TextField(
                    decoration: InputDecoration(
                        label: Text("List Names if Possible")
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text("Mechanical Failure of any vehicle in the accident"),trailing: SizedBox(
                width: 140,
                child: CommonYesOrNo(),
              ),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  TextField(
                    decoration: InputDecoration(
                        label: Text("List Names if Possible")
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text("Was any vehicle in the accident towed"),trailing: SizedBox(
                width: 140,
                child: CommonYesOrNo(),
              ),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  TextField(
                    decoration: InputDecoration(
                        label: Text("List Names if Possible")
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}
