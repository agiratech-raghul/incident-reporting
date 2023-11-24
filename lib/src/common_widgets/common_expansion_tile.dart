import 'package:flutter/material.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_yes_or_no.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';

class CommonExpansionCard extends StatefulWidget {
  const CommonExpansionCard({
    super.key,
    this.title,
    this.trailing,
    this.widget,
    this.onExpansionChanged,
    this.initiallyExpanded = false,
    this.elevation,
    this.dividerColor,
  });
  final String? title;
  final Widget? trailing;
  final Widget? widget;
  final bool? initiallyExpanded;
  final double? elevation;
  final Color? dividerColor;
  final void Function(bool)? onExpansionChanged;

  @override
  State<CommonExpansionCard> createState() => _CommonExpansionCardState();
}

class _CommonExpansionCardState extends State<CommonExpansionCard> {
  bool? isExpnd = false;
  int? isValue = 2;
  final ExpansionTileController? controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: widget.elevation ?? 1,
      child: Theme(
        data: ThemeData(
          dividerColor: widget.dividerColor ?? Colors.transparent,
        ),
        child: ExpansionTile(
          controller: controller,
          textColor: AppColors.primaryColor,
          initiallyExpanded: widget.initiallyExpanded ?? true,
          title: Text(
            widget.title ?? "",
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          trailing: SizedBox(
              width: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 1,
                    groupValue: isValue,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {
                      setState(() {
                        controller?.expand();
                        isValue = value;
                        print(isValue);
                      });
                    },
                  ),
                  const Text("Yes"),
                  Radio(
                    value: 2,
                    groupValue: isValue,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {
                      setState(() {
                        controller?.collapse();
                        isValue = value;
                      });
                      print(value);
                    },
                  ),
                  const Text("No"),
                ],
              )),
          children: <Widget>[widget.widget ?? const SizedBox()],
        ),
      ),
    );
  }
}
