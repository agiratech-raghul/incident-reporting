import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_expansion_tile.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_network_image.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/CommonDetailsCard.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';
import 'package:size_setter/size_setter.dart';

class ThirdScreen extends StatefulWidget {
  final bool? isAnotherVehicle;
  const ThirdScreen({super.key, this.isAnotherVehicle = false});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final bool _isEnable = false;
  bool addPassenger = false;
  int selectedOption = 2;
  int vehicleOption = 2;
  final _pageController = PageController(viewportFraction: 0.877);

  double currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toDouble();
        debugPrint("$currentPage");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isFlow: true,
      title: widget.isAnotherVehicle! ? "Step 4" : "Step 3",
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor),
                  onPressed: () {
                    if (vehicleOption == 2) {
                      Navigator.pushNamed(
                          context, RouteConstants.profileScreen);
                    } else {
                      Navigator.pushNamed(context, RouteConstants.thirdScreen,
                          arguments: {"isAnotherVehicle": true});
                    }
                  },
                  child: const Text("Next Step")))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                  widget.isAnotherVehicle!
                      ? "Another Vehicle Detail"
                      : "Accident with Another Vehicle",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const Text("Vehicle Details",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
            Card(
              shape: Border.all(
                color: Colors.black12,
              ),
              color: AppColors.lightGrey,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CommonTextField(
                              hintText: "Vehicle Model",
                              labelText: "Vehicle Model",
                            ),
                            const CommonTextField(
                                hintText: "Vehicle Color",
                                labelText: "Vehicle Color"),
                            const CommonTextField(
                                hintText: "Plate Number",
                                labelText: "Plate Number"),
                            const CommonTextField(
                                hintText: "Vin Number",
                                labelText: "Vin Number"),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: const CommonNetworkImage(
                                    height: 65,
                                    width: 65,
                                    image:
                                        "https://vardenchi.com/cdn/shop/products/JawarearNPindicator_2.progressive.jpg?v=1633009490",
                                    placeHolder: AppAssets.sampleImage,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Expanded(
                      //   flex: 2,
                      //   child: Container(
                      //     child: const FittedBox(
                      //       child: CommonNetworkImage(
                      //         height: 100,
                      //         width: 100,
                      //         image: "https://i.gifer.com/VdgG.gif",
                      //         placeHolder: AppAssets.sampleImage,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            const Text("Driver Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const CommonDetailsCard(isDriver: true),
            const HeightSpaceBox(size: 20),
            CommonExpansionCard(
              title: widget.isAnotherVehicle!
                  ? "Is there any other person travelled in them?"
                  : "Is there any other person travelled with you?",
              trailing: SizedBox(
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    const Text("Yes"),
                    Radio(
                      value: 2,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    const Text("No"),
                  ],
                ),
              ),
            ),
            // Center(
            //     child: Text(widget.isAnotherVehicle!
            //         ? "Is there any other person travelled in them?"
            //         : "Is there any other person travelled with you?")),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Radio(
            //       value: 1,
            //       groupValue: selectedOption,
            //       onChanged: (value) {
            //         setState(() {
            //           selectedOption = value!;
            //         });
            //       },
            //     ),
            //     const Text("Yes"),
            //     Radio(
            //       value: 2,
            //       groupValue: selectedOption,
            //       onChanged: (value) {
            //         setState(() {
            //           selectedOption = value!;
            //         });
            //       },
            //     ),
            //     const Text("No"),
            //   ],
            // ),
            if (selectedOption == 1) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Passenger Details",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          addPassenger = true;
                        });
                      },
                      child: const Text("Add Passenger"))
                ],
              ),
              SizedBox(
                height: 310,
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    const CommonDetailsCard(),
                    if (addPassenger) const CommonDetailsCard()
                  ],
                ),
              ),
            ],
            if (!widget.isAnotherVehicle!) ...[
              CommonExpansionCard(
                title: "Are you able to enter another vehicle Details?",
                trailing: SizedBox(
                  width: 140,
                  child: Row(
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
                  ),
                ),
              ),
              // const Center(
              //     child:
              //         Text("Are you able to enter another vehicle Details?")),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Radio(
              //       value: 1,
              //       groupValue: vehicleOption,
              //       onChanged: (value) {
              //         setState(() {
              //           vehicleOption = value!;
              //         });
              //       },
              //     ),
              //     const Text("Yes"),
              //     Radio(
              //       value: 2,
              //       groupValue: vehicleOption,
              //       onChanged: (value) {
              //         setState(() {
              //           vehicleOption = value!;
              //         });
              //       },
              //     ),
              //     const Text("No"),
              //   ],
              // ),
            ],
            // SizedBox(
            //     width: double.infinity,
            //     child: ElevatedButton(
            //         style:
            //             ElevatedButton.styleFrom(backgroundColor: Colors.green),
            //         onPressed: () {
            //           if (vehicleOption == 2) {
            //             Navigator.pushNamed(
            //                 context, RouteConstants.profileScreen);
            //           } else {
            //             Navigator.pushNamed(
            //                 context, RouteConstants.thirdScreen,
            //                 arguments: {"isAnotherVehicle": true});
            //           }
            //         },
            //         child: const Text("Next Step")))
          ]),
        ),
      ),
    );
  }
}
