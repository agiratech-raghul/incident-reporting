
import 'package:flutter/material.dart';

class NewSecondScreen extends StatefulWidget {
  const NewSecondScreen({super.key});

  @override
  State<NewSecondScreen> createState() => _NewSecondScreenState();
}

class _NewSecondScreenState extends State<NewSecondScreen> {
  int selectedOption = 2;
  int vehicleOption = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
            ExpansionTile(
              title:Text("Fatality to anyone?"),

            trailing:Container(
              width: 120,
              child: commonYesOrNo(),
            ),
            children: [
              ExpansionTile(title: Text("mjhnghg"))
            ],
            )

          ],
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
  Widget commonYesOrNo(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          value: 1,
          groupValue: vehicleOption,
          onChanged: (value) {
            setState(() {
              vehicleOption = value!;
            });
          },
        ),
        const Text("Yes"),
        Radio(
          value: 2,
          groupValue: vehicleOption,
          onChanged: (value) {
            setState(() {
              vehicleOption = value!;
            });
          },
        ),
        const Text("No"),
      ],
    );
  }
}
