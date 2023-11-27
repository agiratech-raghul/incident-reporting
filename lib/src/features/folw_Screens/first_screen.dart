
import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_network_image.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';
import 'package:size_setter/size_setter.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // final TextEditingController _titleController =
  //     TextEditingController(text: "");
  final TextEditingController _descriptionController =
      TextEditingController(text: "");
  DateTime? selectedDateTime;

  bool isMap = false;

  bool select1 = true;
  bool select2 = false;
  bool select3 = false;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isFlow: true,
      title: "Step 1",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(children: [
            // CommonTextField(
            //   controller: _titleController,
            //   labelText: "Title",
            //   hintText: "Title",
            // ),
            // const SizedBox(
            //   height: 5,
            // ),
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
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: selectedDateTime == null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Incident Date and Time",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w400),
                            )),
                      )
                    : Center(
                        widthFactor: 50.0,
                        child: Text(
                          "Date and Time :  $selectedDateTime",
                          textAlign: TextAlign.start,
                        )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // if (!isMap) ...[
            //   GestureDetector(
            //     onTap: (() {
            //       showMyDialog();
            //     }),
            //     child: Container(
            //       height: 55,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(5),
            //           border: Border.all(color: Colors.grey)),
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Row(
            //           children: [
            //             //Icon(Icons.location_on_sharp),
            //             Align(
            //                 alignment: Alignment.centerLeft,
            //                 child: Text(
            //                   "Incident Location",
            //                   style: TextStyle(
            //                       fontSize: 14,
            //                       color: Colors.grey.shade700,
            //                       fontWeight: FontWeight.w400),
            //                 ))
            //           ],
            //         ),
            //       ),
            //     ),
            //   )
            // ] else ...[
            //   const MapScreen(),
            // ],
            ListBody(
              children: <Widget>[
                Container(
                  height: 250.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade500),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: CommonNetworkImage(
                      image:
                      "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/w_2240,c_limit/GoogleMapTA.jpg",
                      height: 250.h,
                      placeHolder: AppAssets.sampleMaps),
                ),
                const SizedBox(
                  height: 5,
                ),
                const CommonTextField(
                    hintText: 'address',
                    labelText: "address"
                ),
                const CommonTextField(
                    hintText: 'eg.Near apollo',
                    labelText: "LandMark")
              ],
            ),
            CommonTextField(
              maxLines: 5,
              labelText: "Description",
              hintText: "Description",
              controller: _descriptionController,
            ),
            const SizedBox(
              height: 5,
            ),
            selectIncident(),
          ]),
        ),
      ),
    );
  }

  Row selectIncident() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                select1 = true;
                select2 = false;
                select3 = false;
              });
            },
            child: Container(
              height: 120.h,
              //
              // width: 125.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: select1 ? AppColors.primaryColor : Colors.black54,
                      width: select1 ? 3 : 1)),
              child: const Center(
                child: Text(
                  "Accident with another vehicle",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              // setState(() {
              //   select1 = false;
              //   select2 = true;
              //   select3 = false;
              // });
            },
            child: Container(
              height: 120.h,
              //width: 125.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: select2 ? AppColors.primaryColor : Colors.black54,
                      width: select2 ? 3 : 1)),
              child: const Center(
                child: Text(
                  "Damaged public/private property",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              // setState(() {
              //   select1 = false;
              //   select2 = false;
              //   select3 = true;
              // });
            },
            child: Container(
              height: 120.h,
             // width: 125.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: select3 ? AppColors.primaryColor : Colors.black54,
                      width: select3 ? 3 : 1)),
              child: const Center(
                child: Text(
                  "Damage to pedestrian/other pedestrian/bicyclist",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  // Future<void> showMyDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         contentPadding: const EdgeInsets.all(5),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Container(
  //                 height: 250,
  //                 width: 320,
  //                 decoration: BoxDecoration(
  //                     color: Colors.amber,
  //                     border: Border.all(color: Colors.black)),
  //                 child: const CommonNetworkImage(
  //                     image:
  //                         "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/w_2240,c_limit/GoogleMapTA.jpg",
  //                     height: 250,
  //                     placeHolder: AppAssets.sampleMaps),
  //               ),
  //               const SizedBox(
  //                 height: 10,
  //               ),
  //               TextFormField(
  //                 initialValue:
  //                     'Mount Poonamalle High Rd, St.Thomas Mount, Tamil Nadu 600016.',
  //                 decoration: const InputDecoration(
  //                     border: OutlineInputBorder(),
  //                     hintText: 'address',
  //                     labelText: "address"),
  //               ),
  //               const SizedBox(
  //                 height: 10,
  //               ),
  //               TextFormField(
  //                   initialValue: 'near s.t thomas mount',
  //                   decoration: const InputDecoration(
  //                       border: OutlineInputBorder(),
  //                       hintText: 'eg.Near apollo',
  //                       labelText: "LandMark"))
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           Center(
  //             child: ElevatedButton(
  //               child: const Text('Confirom Location'),
  //               onPressed: () {
  //                 setState(() {
  //                   isMap = !isMap;
  //                 });
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
