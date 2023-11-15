import 'package:flutter/material.dart';

class CommonSelect extends StatefulWidget {
  const CommonSelect({super.key, required this.text, required this.text1, required this.text2, required this.text3});
  final String text;
  final String text1;
  final String text2;
  final String text3;


  @override
  State<CommonSelect> createState() => _CommonSelectState();
}

class _CommonSelectState extends State<CommonSelect> {
  bool value=false;
  bool value1=false;
  bool value2=false;
  bool value3=false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(onPressed: (){
          setState(() {
            value = true;
            value1 =false;
            value2=false;
            value3=false;
          });
        }, child: Text(widget.text),  style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(value?Colors.lightGreenAccent:Colors.black12))),
        ElevatedButton(onPressed: (){
          setState(() {
            value = false;
            value1 =true;
            value2=false;
            value3=false;
          });
        }, child: Text(widget.text1),  style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(value1?Colors.lightGreenAccent:Colors.black12))),
        ElevatedButton(onPressed: (){
          setState(() {
            value = false;
            value1 =false;
            value2=true;
            value3=false;
          });
        }, child: Text(widget.text2),  style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(value2?Colors.lightGreenAccent:Colors.black12))),
        ElevatedButton(onPressed: (){
          setState(() {
            value = false;
            value1 =false;
            value2=false;
            value3=true;
          });
        }, child: Text(widget.text3),  style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(value3?Colors.lightGreenAccent:Colors.black12))),
      ],
    );
  }
}
