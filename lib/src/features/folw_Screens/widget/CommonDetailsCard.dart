import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_text_field.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';
import 'package:size_setter/size_setter.dart';

class CommonDetailsCard extends StatelessWidget {
  const CommonDetailsCard({super.key, this.isDriver = false});
  final bool isDriver;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: Border.all(
        color: Colors.black12,
      ),
      color: AppColors.lightGrey,
      margin: isDriver
          ? const EdgeInsets.symmetric(vertical: 10)
          : const EdgeInsets.all(9),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height/2.9.h,
        width: 400,
        child: Column(
          children: [
            ElevatedButton.icon(
                icon: const Icon(Icons.add),
                onPressed: () {},
                style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.primaryTextColor),
                ),
                label: Text(
                  isDriver ? "add Driver ID" : "add Passenger ID",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                )),
            const Row(children: <Widget>[
              Expanded(child: Divider()),
              Text("OR"),
              Expanded(child: Divider()),
            ]),
            const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      CommonTextField(
                        labelText: "Name",
                        hintText: "Name",
                      ),
                      CommonTextField(
                        labelText: "Phone Number",
                        hintText: "Phone Number",
                      ),
                      CommonTextField(
                        labelText: "Email",
                        hintText: "Email",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
