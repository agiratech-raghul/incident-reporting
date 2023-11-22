import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_network_image.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/utils/src/helpers/size_utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DateTime? selectedDateTime;
  final TextEditingController _nameController = TextEditingController(text: "");
  final TextEditingController _middleNameController =
      TextEditingController(text: "");
  final TextEditingController _lastNameController =
      TextEditingController(text: "");
  final TextEditingController _dobController = TextEditingController(text: "");
  final TextEditingController _homeAddress = TextEditingController(text: "");
  final TextEditingController _phoneNumberController =
      TextEditingController(text: "");
  final TextEditingController _emailController =
      TextEditingController(text: "");
  final TextEditingController _licenceController =
      TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isFlow: true,
      title: "Step 5",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Profile Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const HeightSpaceBox(size: 20),
              CommonTextField(
                controller: _nameController,
                labelText: "First Name",
                hintText: "Enter Your First Name",
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: CommonTextField(
                        controller: _middleNameController,
                        labelText: "Middle Name",
                        hintText: "Enter Your Middle Name",
                      ),
                    ),
                    const WidthSpaceBox(size: 6),
                    Expanded(
                      child: CommonTextField(
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
                child: CommonTextField(
                  controller: _dobController,
                  labelText: "DOB",
                  hintText: "Enter Your DOB",
                  enabled: false,
                  icon: const Icon(Icons.calendar_month),
                ),
              ),
              CommonTextField(
                controller: _homeAddress,
                labelText: "Home Address",
                hintText: "Enter Your Address",
                maxLines: 4,
              ),
              CommonTextField(
                controller: _phoneNumberController,
                labelText: "Phone Number",
                hintText: "Enter Your Phone Number",
              ),
              CommonTextField(
                controller: _emailController,
                labelText: "Email ID",
                hintText: "Enter Your Email ID",
              ),
              CommonTextField(
                controller: _licenceController,
                labelText: "Licence Number",
                hintText: "Enter Your Licence Number",
              ),
              const HeightSpaceBox(size: 10),
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
                  TextButton(onPressed: () {}, child: const Text("Add Images")),
                  const WidthSpaceBox(size: 10),
                ],
              ),
              const HeightSpaceBox(size: 10),
            ],
          ),
        ),
      ),
    );
  }
}
