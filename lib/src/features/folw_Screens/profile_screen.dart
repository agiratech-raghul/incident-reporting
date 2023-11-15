import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_network_image.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/utils/src/helpers/size_utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DateTime? selectedDateTime;
  final TextEditingController _nameController =
  TextEditingController(text: "");
  final TextEditingController _middleNameController =
  TextEditingController(text: "");
  final TextEditingController _lastNameController =
  TextEditingController(text: "");
  final TextEditingController _dobController =
  TextEditingController(text: "");
  final TextEditingController _homeAddress =
  TextEditingController(text: "");
  final TextEditingController _phoneNumberController =
  TextEditingController(text: "");
  final TextEditingController _emailController =
  TextEditingController(text: "");
  final TextEditingController _licenceController =
  TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Step 3"),
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Profile Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              HeightSpaceBox(size: 20),
              ProfileTextField(
                controller: _nameController,
                labelText: "First Name",
                hintText: "Enter Your First Name",
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: ProfileTextField(
                        controller: _middleNameController,
                        labelText: "Middle Name",
                        hintText: "Enter Your Middle Name",
                      ),
                    ),
                    WidthSpaceBox(size: 6),
                    Expanded(
                      child: ProfileTextField(
                        controller: _lastNameController,
                        labelText: "Last Name",
                        hintText: "Enter Your Last Name",
                      ),
                    ),
                  ],
                ),
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
                          _dobController.text = selectedDate.toString();
                        }
                      });
                    }
                  });
                }),
                child: ProfileTextField(
                  controller: _dobController,
                  labelText: "DOB",
                  hintText: "Enter Your DOB",
                  enabled: false,
                  icon: Icon(Icons.calendar_month),
                ),
              ),
              ProfileTextField(
                controller: _homeAddress,
                labelText: "Home Address",
                hintText: "Enter Your Address",
                maxLines: 4,
              ),
              ProfileTextField(
                controller: _phoneNumberController,
                labelText: "Phone Number",
                hintText: "Enter Your Phone Number",
              ),
              ProfileTextField(
                controller: _emailController,
                labelText: "Email ID",
                hintText: "Enter Your Email ID",
              ),
              ProfileTextField(
                controller: _licenceController,
                labelText: "Licence Number",
                hintText: "Enter Your Licence Number",
              ),
              HeightSpaceBox(size: 10),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: const CommonNetworkImage(
                      height: 100,
                      image:
                      "https://st2.depositphotos.com/2931363/6263/i/450/depositphotos_62630621-stock-photo-young-man-making-selfie.jpg",
                      placeHolder: AppAssets.sampleImage,
                    ),
                  ),
                  TextButton(onPressed: (){}, child: Text("Add Images")),
                  const WidthSpaceBox(size: 10),
                ],
              ),
              HeightSpaceBox(size: 10),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {

                          Navigator.pushNamed(context, RouteConstants.profileScreen);
                      },
                      child: const Text("Next Step")))
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key, this.labelText, this.hintText, this.icon, this.maxLines, this.enabled =true, this.controller,
  });
  final String? labelText;
  final String? hintText;
  final Icon? icon;
  final int? maxLines;
  final bool? enabled;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,),
      child: TextField(
        controller: controller,
        maxLines: maxLines??null,
        decoration: InputDecoration(
          alignLabelWithHint: true,
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey)),
          border: OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
          enabled: enabled!,
          suffixIcon: IconButton(onPressed: (){},icon: icon??SizedBox(),)
          // prefixIcon:
          // IconButton(onPressed: () {}, icon: icon!),
        ),
      ),
    );
  }
}
