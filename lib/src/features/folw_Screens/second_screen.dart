import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incident_reporting/src/common_widgets/common_expansion_tile.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field.dart';
import 'package:incident_reporting/src/common_widgets/src/buttons/outline_button.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_car_view_card.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_select.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';
import 'package:size_setter/size_setter.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool isSelected = false;
  bool isOptionsSelected = false;
  bool expand = false;
  FocusNode? myFocusNode = FocusNode();
  final TextEditingController _insuredVehicleController =
      TextEditingController(text: "");
  XFile? frontView;
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isFlow: true,
      title: "Step 2",
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(children: [
              Card(
                elevation: 0,
                color: AppColors.lightGrey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: isSelected
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Same Direction Swipe"),
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      isSelected = !isSelected;
                                    });
                                  },
                                  child: const Text("Change"))
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: SecondaryButton(
                                      onPressed: () {
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
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: SecondaryButton(
                                      onPressed: () {
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
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: SecondaryButton(
                                      onPressed: () {
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
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SecondaryButton(
                                  onPressed: () {
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
                                  onPressed: () {
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
              CommonExpansionCard(
                title: "Injuries to anyone?",
                widget: GestureDetector(
                  onTap: () {
                    setState(() {
                      isOptionsSelected = !isOptionsSelected;
                    });
                  },
                  child: Column(
                    children: [
                      const CommonSelect(
                          text: 'Ins Veh',
                          text1: 'Adv Veh',
                          text2: 'PKD',
                          text3: 'BKD'),
                      !isOptionsSelected
                          ? CommonTextField(
                              horizontal: 20,
                              controller: _insuredVehicleController,
                              border: InputBorder.none,
                              labelText: "List if Any Names Possible",
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
              const CommonExpansionCard(
                title: "Fatality to anyone?",
                widget: CommonSelect(
                    text: 'Ins Veh',
                    text1: 'Adv Veh',
                    text2: 'PKD',
                    text3: 'BKD'),
              ),
              const CommonExpansionCard(
                initiallyExpanded: true,
                title: "Was emergency service at the scene?",
                widget: CommonSelect(
                    text: 'Police',
                    text1: 'Ambulance',
                    text2: 'Both',
                    text3: 'None'),
              ),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CarView(
                              title:
                                  "https://ticketing-dev.excelsior-fht.com/api/ticket/17023843706001-Screenshot20231212at4.03.23PM.png"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CarView(
                                title:
                                    "https://ticketing-dev.excelsior-fht.com/api/ticket/17023843705920-Screenshot20231212at4.02.59PM.png",
                              ),
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Text(""),
                              ),
                              CarView(
                                title:
                                    "https://ticketing-dev.excelsior-fht.com/api/ticket/17023843706002-Screenshot20231212at4.03.32PM.png",
                              ),
                            ],
                          ),
                          CarView(
                            title:
                                "https://ticketing-dev.excelsior-fht.com/api/ticket/17023843706013-Screenshot20231212at4.03.39PM.png",
                          ),
                        ]),
                  ),
                ),
              )
            ])),
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
                      onTap: () {
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
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Center(
                            child: Text(one!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 14)),
                          ),
                        ),
                      ),
                    ),
                    const WidthSpaceBox(size: 5),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(
                          child: Text(two!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14)),
                        ),
                      ),
                    ),
                    const WidthSpaceBox(size: 5),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(
                          child: Text(three!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14)),
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
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(
                          child: Text(four!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14)),
                        ),
                      ),
                    ),
                    const WidthSpaceBox(size: 5),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(
                          child: Text(five!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14)),
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
