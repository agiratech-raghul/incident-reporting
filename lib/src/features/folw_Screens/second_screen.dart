
import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_select.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_yes_or_no.dart';

import '../../routing/route_constants.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

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
                color: Colors.yellow[200],
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              showMyIncedent(
                                  "Side Swipe",
                                  "Same Direction Swipe",
                                  "Opposite Direction Swipe",
                                  "Another Vehicle Swiped My Parked Vehicle",
                                  "I Swiped Another Parked Vehicle",
                                  "Other- Side Swipe");
                            },
                            child: const Text("Rear End Collision")),
                        ElevatedButton(
                            onPressed: () {
                              showMyIncedent(
                                  "Side Swipe",
                                  "Same Direction Swipe",
                                  "Opposite Direction Swipe",
                                  "Another Vehicle Swiped My Parked Vehicle",
                                  "I Swiped Another Parked Vehicle",
                                  "Other- Side Swipe");
                            },
                            child: const Text("Side Swipe")),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Hit and Run"))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text("Side Impact Collision")),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text("Head- on Collision")),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              ExpansionTile(title: Text("Injuries to anyone?"),
              trailing: Container(
                width: 140,
                child: CommonYesOrNo(),
              ),
              children: [
                ExpansionTile(
                  title: Text("Insured Vehicle"),trailing: Container(
                  width: 140,
                  child: CommonYesOrNo(),
                ),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  TextField(
                    decoration: InputDecoration(
                        label: Text("list names if possible")
                    ),
                  ),
                ],
                ),
                ExpansionTile(
                  title: Text("Adverse Vehicle"),trailing: Container(
                  width: 140,
                  child: CommonYesOrNo(),
                ),
                  childrenPadding: EdgeInsets.all(10),
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          label: Text("list names if possible")
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text("PKD"),trailing: Container(
                  width: 140,
                  child: CommonYesOrNo(),
                ),
                  childrenPadding: EdgeInsets.all(10),
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          label: Text("list names if possible")
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text("BKD"),trailing: Container(
                  width: 140,
                  child: CommonYesOrNo(),
                ),
                  childrenPadding: EdgeInsets.all(10),
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          label: Text("list names if possible")
                      ),
                    ),
                  ],
                ),
              ],
              ),
              ExpansionTile(
                title:Text("Fatality to anyone?"),

              trailing:Container(
                width: 140,
                child: CommonYesOrNo(),
              ),
              children: [
            CommonSelect(text: 'Ins Veh', text1: 'Adv Veh', text2: 'PKD', text3: 'BKD')
              ],
              ),
              ExpansionTile(
                initiallyExpanded: true,
                title:Text("Was emergency service at the scene "),
                children: [
                  CommonSelect(text: 'Police', text1: 'Ambulance', text2: 'Both', text3: 'None')

                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        Navigator.pushNamed(context, RouteConstants.secondScreen);
                      },
                      child: const Text("Next Step")))
            ],
          ),
        ),
      ),
    );
  }
  Future<void> showMyIncedent(
      String? title,
      String? one,
      String? two,
      String? three,
      String? four,
      String? five,
      ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
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
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(color: Colors.amber[200]),
                      child: Center(
                        child: Text(one!, textAlign: TextAlign.center),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(color: Colors.amber[200]),
                      child: Center(
                        child: Text(two!, textAlign: TextAlign.center),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(color: Colors.amber[200]),
                      child: Center(
                        child: Text(three!, textAlign: TextAlign.center),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(color: Colors.amber[200]),
                      child: Center(
                        child: Text(four!, textAlign: TextAlign.center),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(color: Colors.amber[200]),
                      child: Center(
                        child: Text(five!, textAlign: TextAlign.center),
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
