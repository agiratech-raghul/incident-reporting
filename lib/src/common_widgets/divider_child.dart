import 'package:flutter/material.dart';
import 'package:incident_reporting/src/ui_utils/text_styles.dart';

class DividerChild extends StatelessWidget {
  const DividerChild({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Expanded(
            child: Divider(
          height: 2,
        )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
          child: Text(
            text,
            style: TextStyles.secondaryTextStyle,
          ),
        ),
        const Expanded(
            child: Divider(
          height: 2,
        )),
      ],
    );
  }
}
