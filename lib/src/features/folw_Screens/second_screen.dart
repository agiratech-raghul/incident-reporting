import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/common_widgets/src/buttons/outline_button.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_select.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_yes_or_no.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';
import 'package:incident_reporting/src/utils/src/helpers/size_utils.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: "Step 2",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              Card(
                elevation: 0,
                color: AppColors.lightGrey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: isSelected?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Same Direction Swipe"),

                        OutlinedButton(onPressed: (){
                          setState(() {
                            isSelected = !isSelected;
                          });

                        }, child:Text("Change"))
                      ],
                    ),
                  )
                      :Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SecondaryButton(
                            onPressed: (){
                              showMyIncident(
                                  "Rear End Collision",
                                  "Same Direction Swipe",
                                  "Opposite Direction Swipe",
                                  "Another Vehicle Swiped My Parked Vehicle",
                                  "I Swiped Another Parked Vehicle",
                                  "Other- Side Swipe");
                            },
                            text: "Rear End Collision",
                          ),
                          SecondaryButton(
                            onPressed: (){
                              showMyIncident(
                                  "Side Swipe",
                                  "Same Direction Swipe",
                                  "Opposite Direction Swipe",
                                  "Another Vehicle Swiped My Parked Vehicle",
                                  "I Swiped Another Parked Vehicle",
                                  "Other- Side Swipe");
                            },
                            text: "Side Swipe",
                          ),
                          SecondaryButton(
                            onPressed: (){
                              showMyIncident(
                                  "Hit and Run",
                                  "Same Direction Swipe",
                                  "Opposite Direction Swipe",
                                  "Another Vehicle Swiped My Parked Vehicle",
                                  "I Swiped Another Parked Vehicle",
                                  "Other- Side Swipe");
                            },
                            text: "Hit and Run",
                          ),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SecondaryButton(
                            onPressed: (){
                              showMyIncident(
                                  "Side Impact Collision",
                                  "Same Direction Swipe",
                                  "Opposite Direction Swipe",
                                  "Another Vehicle Swiped My Parked Vehicle",
                                  "I Swiped Another Parked Vehicle",
                                  "Other- Side Swipe");
                            },
                            text: "Side Impact Collision",
                          ),
                          const WidthSpaceBox(size: 10),
                          SecondaryButton(
                            onPressed: (){
                              showMyIncident(
                                  "Head-On Collision",
                                  "Same Direction Swipe",
                                  "Opposite Direction Swipe",
                                  "Another Vehicle Swiped My Parked Vehicle",
                                  "I Swiped Another Parked Vehicle",
                                  "Other- Side Swipe");
                            },
                            text: "Head-On Collision",
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ExpansionTile(
                title: Text("Injuries to anyone?"),
                trailing: SizedBox(
                  width: 140,
                  child: CommonYesOrNo(),
                ),
                children: [
                  ExpansionTile(
                    title: Text("Insured Vehicle"),
                    trailing: SizedBox(
                      width: 140,
                      child: CommonYesOrNo(),
                    ),
                    childrenPadding: EdgeInsets.all(10),
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            label: Text("list names if possible")),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text("Adverse Vehicle"),
                    trailing: SizedBox(
                      width: 140,
                      child: CommonYesOrNo(),
                    ),
                    childrenPadding: EdgeInsets.all(10),
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            label: Text("list names if possible")),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text("PKD"),
                    trailing: SizedBox(
                      width: 140,
                      child: CommonYesOrNo(),
                    ),
                    childrenPadding: EdgeInsets.all(10),
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            label: Text("list names if possible")),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text("BKD"),
                    trailing: SizedBox(
                      width: 140,
                      child: CommonYesOrNo(),
                    ),
                    childrenPadding: EdgeInsets.all(10),
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            label: Text("list names if possible")),
                      ),
                    ],
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text("Fatality to anyone?"),
                trailing: SizedBox(
                  width: 140,
                  child: CommonYesOrNo(),
                ),
                children: [
                  CommonSelect(
                      text: 'Ins Veh',
                      text1: 'Adv Veh',
                      text2: 'PKD',
                      text3: 'BKD')
                ],
              ),
              const ExpansionTile(
                initiallyExpanded: true,
                title: Text("Was emergency service at the scene "),
                children: [
                  CommonSelect(
                      text: 'Police',
                      text1: 'Ambulance',
                      text2: 'Both',
                      text3: 'None')
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showMyIncident(
    String? title,
    String? one,
    String? two,
    String? three,
    String? four,
    String? five,
  ) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(10),
          title: Text(title!),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        setState(() {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        });
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(color: Colors.white,border: Border.all(color: AppColors.primaryColor),borderRadius: const BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Center(
                            child: Text(one!, textAlign: TextAlign.center,style: TextStyle(fontSize: 14)),
                          ),
                        ),
                      ),
                    ),
                    const WidthSpaceBox(size: 5),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(color: Colors.white,border: Border.all(color: AppColors.primaryColor),borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(
                          child: Text(two!, textAlign: TextAlign.center,style: TextStyle(fontSize: 14)),
                        ),
                      ),
                    ),
                    const WidthSpaceBox(size: 5),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(color: Colors.white,border: Border.all(color: AppColors.primaryColor),borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(
                          child: Text(three!, textAlign: TextAlign.center,style: TextStyle(fontSize: 14)),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(color: Colors.white,border: Border.all(color: AppColors.primaryColor),borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(
                          child: Text(four!, textAlign: TextAlign.center,style: TextStyle(fontSize: 14)),
                        ),
                      ),
                    ),
                    const WidthSpaceBox(size: 5),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(color: Colors.white,border: Border.all(color: AppColors.primaryColor),borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(
                          child: Text(five!, textAlign: TextAlign.center,style: TextStyle(fontSize: 14)),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
