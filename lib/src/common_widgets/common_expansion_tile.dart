import 'package:flutter/material.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';

class CommonExpansionCard extends StatefulWidget {
  const CommonExpansionCard({
    super.key, this.title, this.trailing, this.widget, this.onExpansionChanged, this.initiallyExpanded = false, this.elevation, this.dividerColor,
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
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: widget.elevation ?? 1,
      child: Theme(
        data: ThemeData(
            dividerColor: widget.dividerColor?? Colors.transparent,
        ),
        child: ExpansionTile(
          textColor: AppColors.primaryColor,
          initiallyExpanded: widget.initiallyExpanded??true,
          onExpansionChanged: widget.onExpansionChanged??(bool isExpand) {
            setState(() {
              isExpnd == isExpand;
            });
          },
          title: Text(
            widget.title??"",
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          trailing: widget.trailing??const Icon(Icons.keyboard_arrow_down_rounded),
          children: <Widget>[
            widget.widget??const SizedBox()
          ],
        ),
      ),
    );
  }
}