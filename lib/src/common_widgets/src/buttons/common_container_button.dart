import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton(
      {super.key,
      required this.onTap,
      this.color,
      this.widget,
      this.height,
      this.width});

  final VoidCallback onTap;
  final Color? color;
  final double? height;
  final double? width;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: color),
        child: widget,
      ),
    );
  }
}
