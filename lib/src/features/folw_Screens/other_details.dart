import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_expansion_tile.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/commonOptionsContainers.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_yes_or_no.dart';
import 'package:size_setter/size_setter.dart';

class OtherInfoScreen extends StatefulWidget {
  const OtherInfoScreen({super.key});

  @override
  State<OtherInfoScreen> createState() => _OtherInfoScreenState();
}

class _OtherInfoScreenState extends State<OtherInfoScreen> {
  String dropDownValue = 'Ola';

  var items = ['Ola', 'Uber', 'Rapido', 'Lyft', 'Grab Cabs', 'Others'];
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isFlow: true,
      title: "Step 6",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              CommonExpansionCard(
                title:"Ambulance/was any party sent to ER",
                widget: CommonTextField(
                  labelText: "List Names if Possible",
                  hintText: "List Names if Possible",
                  border: InputBorder.none,
                  horizontal: 20.w,
                ),
              ),
              CommonExpansionCard(
                title:"Witness – if yes Contact information",
                widget: CommonTextField(
                  labelText: "List Names if Possible",
                  hintText: "List Names if Possible",
                  border: InputBorder.none,
                  horizontal: 20.w,
                ),
              ),
              CommonExpansionCard(
                title:"Were there any Minors",
                widget: CommonTextField(
                  labelText: "List Names and Age if possible",
                  hintText: "List Names and Age if possible",
                  border: InputBorder.none,
                  horizontal: 20.w,
                ),
              ),
              CommonExpansionCard(
                title:"Any Criminal acts by Adverse",
                widget: CommonTextField(
                  labelText: "Enter a Brief Information about it",
                  hintText: "Enter a Brief Information about it",
                  border: InputBorder.none,
                  horizontal: 20.w,
                ),
              ),
              CommonExpansionCard(
                title:"Was a TNC company involved with the accident",
                widget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
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
                      if (dropDownValue == "Others")
                        const Expanded(child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: CommonTextField(labelText: "Enter the Other Names",
                          hintText: "Enter the Other Names",border: InputBorder.none,),
                        ))
                    ],
                  ),
                ),
              ),
              const CommonExpansionCard(
                title:"Weather Conditions",
                widget: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: CommonOptionsContainers(
                    option1: "☀️",
                    optionName1: "Sunny",
                    option2: "🌧️",
                    optionName2: "Rainy",
                    option3: "❄️",
                    optionName3: "Snow",
                  ),
                )
              ),
              const CommonExpansionCard(
                title: "Road Conditions",
                widget:  Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: CommonOptionsContainers(
                    option1: "🛣️",
                    optionName1: "Normal Road",
                    option2: "⛐",
                    optionName2: "Slippery Road",
                    option3: "🚧",
                    optionName3: "Construction",
                    option4: "🕳️",
                    optionName4: "Pot hole",
                  ),
                ),
              ),
              const CommonExpansionCard(
                title: "Traffic Conditions",
                widget:  Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: CommonOptionsContainers(
                    option1: "🛑",
                    optionName1: "Stop Sign",
                    option2: "🏮",
                    optionName2: "Red Light",
                    option3: "⛙",
                    optionName3: "Merge",
                    option4: "🚷",
                    optionName4: "Stop Sign",
                  ),
                )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
