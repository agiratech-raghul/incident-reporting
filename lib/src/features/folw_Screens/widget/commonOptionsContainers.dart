import 'package:flutter/material.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';

class CommonOptionsContainers extends StatefulWidget {
  const CommonOptionsContainers({super.key, this.option1, this.option2, this.option3, this.option4, this.optionName1, this.optionName2, this.optionName3, this.optionName4});
  final String? option1;
  final String? option2;
  final String? option3;
  final String? option4;
  final String? optionName1;
  final String? optionName2;
  final String? optionName3;
  final String? optionName4;

  @override
  State<CommonOptionsContainers> createState() => _CommonOptionsContainersState();
}

class _CommonOptionsContainersState extends State<CommonOptionsContainers> {
  bool select1 = false;
  bool select2 = false;
  bool select3 = false;
  bool select4 = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              select1 = true;
              select2 = false;
              select3 = false;
              select4 =false;
            });
          },
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: select1 ? AppColors.primaryColor : Colors.black54, width: 1)),
                child: Center(
                  child: Text(
                    widget.option1??"",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Text(widget.optionName1??"")
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              select1 = false;
              select2 = true;
              select3 = false;
              select4 =false;
            });
          },
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: select2 ? AppColors.primaryColor : Colors.black54, width: 1)),
                child: Center(
                  child: Text(
                    widget.option2??"",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Text(widget.optionName2??"")
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              select1 = false;
              select2 = false;
              select3 = true;
              select4 =false;
            });
          },
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: select3 ? AppColors.primaryColor : Colors.black54, width: 1)),
                child: Center(
                  child: Text(
                    widget.option3??"",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Text(widget.optionName3??"")
            ],
          ),
        ),
       if(widget.option4 != null) GestureDetector(
          onTap: () {
            setState(() {
              select1 = false;
              select2 = false;
              select3 = false;
              select4 =true;
            });
          },
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: select4 ? AppColors.primaryColor : Colors.black54, width: 1)),
                child: Center(
                  child: Text(
                    widget.option4??"",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Text(widget.optionName4??"")
            ],
          ),
        )
      ],
    );
  }
}
