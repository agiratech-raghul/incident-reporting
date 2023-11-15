import 'dart:async';

import 'package:flutter/material.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/map_widget.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  DateTime? selectedDateTime;

  bool isMap = false;

  bool select1 = false;
  bool select2 = false;
  bool select3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Create New Incident',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(children: [
            const Center(
                child: Text(
              "Step 1",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            )),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Title',
                  labelText: "Title"),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (() {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((selectedTime) {
                      if (selectedTime != null) {
                        selectedDateTime = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );
                        setState(() {});
                      }
                    });
                  }
                });
              }),
              child: Container(
                height: 45,
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: selectedDateTime == null
                    ? const Center(child: Text("Select Date and Time"))
                    : Center(
                        widthFactor: 50.0,
                        child: Text(
                          "Date and Time :  $selectedDateTime",
                          textAlign: TextAlign.start,
                        )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (!isMap) ...[
              GestureDetector(
                onTap: (() {
                  showMyDialog();
                }),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.pinkAccent)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_sharp),
                      Text(" get location")
                    ],
                  ),
                ),
              )
            ] else ...[
              const MapScreen(),
            ],
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              minLines: 5,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: 'description',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            selectIncident(),
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
          ]),
        ),
      ),
    );
  }

  Row selectIncident() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              select1 = true;
              select2 = false;
              select3 = false;
            });
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.lightBlue[300],
                border: Border.all(
                    color: select1 ? Colors.green : Colors.black54, width: 3)),
            child: const Center(
              child: Text(
                "Accident with another vehicle",
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              select1 = false;
              select2 = true;
              select3 = false;
            });
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.lightBlue[300],
                border: Border.all(
                    color: select2 ? Colors.green : Colors.black54, width: 3)),
            child: const Center(
              child: Text(
                "Damaged public/private property",
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              select1 = false;
              select2 = false;
              select3 = true;
            });
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.lightBlue[300],
                border: Border.all(
                    color: select3 ? Colors.green : Colors.black54, width: 3)),
            child: const Center(
              child: Text(
                "Damage to pedestrian/other pedestrian/bicyclist",
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(5),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  height: 250,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(color: Colors.black)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue:
                      'Mount Poonamalle High Rd, St.Thomas Mount, Tamil Nadu 600016.',
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'address',
                      labelText: "address"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    initialValue: 'near s.t thomas mount',
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'eg.Near apollo',
                        labelText: "LandMark"))
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                child: const Text('Confirom Location'),
                onPressed: () {
                  setState(() {
                    isMap = !isMap;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
