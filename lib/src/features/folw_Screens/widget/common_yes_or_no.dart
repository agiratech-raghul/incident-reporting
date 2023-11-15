import 'package:flutter/material.dart';

class CommonYesOrNo extends StatefulWidget {
  const CommonYesOrNo({super.key});

  @override
  State<CommonYesOrNo> createState() => _CommonYesOrNoState();
}

class _CommonYesOrNoState extends State<CommonYesOrNo> {
  int? isValue=2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          value: 1,
          groupValue: isValue,
          onChanged: (value) {
            setState(() {
              isValue = value;
              print(isValue);
            });
          },
        ),
        const Text("Yes"),
        Radio(
          value: 2,
          groupValue: isValue,
          onChanged: (value) {
            setState(() {
              isValue = value;
            });
            print(value);
          },
        ),
        const Text("No"),
      ],
    );
  }
}
