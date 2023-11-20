import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
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
            disabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey)),
            border: const OutlineInputBorder(),
            labelText: labelText,
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