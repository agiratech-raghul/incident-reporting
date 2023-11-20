import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_network_image.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/CommonDetailsCard.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/utils/src/helpers/size_utils.dart';

class ThirdScreen extends StatefulWidget {
  final bool? isAnotherVehicle;
  const ThirdScreen({super.key, this.isAnotherVehicle = false});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final TextEditingController _vehicleModelController =
      TextEditingController(text: "");
  final TextEditingController _vehicleColorController =
      TextEditingController(text: "");
  final TextEditingController _plateNumberController =
      TextEditingController(text: "");
  final TextEditingController _vinController = TextEditingController(text: "");

  bool _isEnable = false;
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
      title: widget.isAnotherVehicle! ? "Step 4" : "Step 3",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  widget.isAnotherVehicle!
                      ? "Another Vehicle Detail"
                      : "Accident with Another Vehicle",
                  style: const TextStyle(fontSize: 25)),
            ),
            Card(
              color: Colors.grey.shade200,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Vehicle Details",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              setState(() {
                                _isEnable = true;
                              });
                            })
                      ],
                    ),
                    CommonTextField(
                        controller: _vehicleModelController,
                        isEnable: _isEnable,
                        hintText: "Vehicle Model"),
                    CommonTextField(
                        controller: _vehicleColorController,
                        isEnable: _isEnable,
                        hintText: "Vehicle Color"),
                    CommonTextField(
                        controller: _plateNumberController,
                        isEnable: _isEnable,
                        hintText: "Plate Number"),
                    CommonTextField(
                        controller: _vinController,
                        isEnable: _isEnable,
                        hintText: "Vin Number"),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: const CommonNetworkImage(
                            height: 50,
                            image:
                                "https://vardenchi.com/cdn/shop/products/JawarearNPindicator_2.progressive.jpg?v=1633009490",
                            placeHolder: AppAssets.sampleImage,
                          ),
                        ),
                        const WidthSpaceBox(size: 10),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(height: 50, AppAssets.addIcon)),
                      ],
                    ),
                    const HeightSpaceBox(size: 20)
                  ],
                ),
              ),
            ),
            const Text("Driver Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const CommonDetailsCard(isDriver: true),
            const HeightSpaceBox(size: 20),
            Center(
                child: Text(widget.isAnotherVehicle!
                    ? "Is there any other person travelled in them?"
                    : "Is there any other person travelled with you?")),
            Row(
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
            if (selectedOption == 1) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Passenger Detail",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                height: 300,
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
              const Center(
                  child:
                      Text("Are you able to enter another vehicle Details?")),
              Row(
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
            ],
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      if (widget.isAnotherVehicle!) {
                        Navigator.pushNamed(
                            context, RouteConstants.profileScreen);
                      } else {
                        Navigator.pushNamed(
                            context, RouteConstants.secondScreen,
                            arguments: {"isAnotherVehicle": true});
                      }
                    },
                    child: const Text("Next Step")))
          ]),
        ),
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.controller,
    required this.isEnable,
    required this.hintText,
  });

  final TextEditingController controller;
  final bool isEnable;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        enabled: isEnable,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
