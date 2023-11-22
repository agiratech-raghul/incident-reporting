import 'package:flutter/material.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key, this.labelText, this.hintText, this.icon, this.maxLines, this.enabled =true, this.controller, this.border, this.horizontal,
  });
  final String? labelText;
  final String? hintText;
  final Icon? icon;
  final int? maxLines;
  final bool? enabled;
  final InputBorder? border;
  final double? horizontal;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    FocusNode? myFocusNode = FocusNode();
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5,horizontal: horizontal??0),
      child: TextField(
        controller: controller,
        focusNode: myFocusNode,
        maxLines: maxLines??null,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            disabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey)),
            border: border ?? const OutlineInputBorder(),
            labelText: labelText,
            labelStyle: TextStyle(
                color: myFocusNode.hasFocus ? AppColors.primaryColor : Colors.black
            ),
            hintText: hintText,
            enabled: enabled!,
            suffixIcon: IconButton(onPressed: (){},icon: icon??const SizedBox(),)
          // prefixIcon:
          // IconButton(onPressed: () {}, icon: icon!),
        ),
      ),
    );
  }
}