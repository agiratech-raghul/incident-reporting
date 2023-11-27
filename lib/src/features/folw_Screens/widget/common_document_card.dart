import 'package:flutter/material.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';
import 'package:incident_reporting/src/utils/src/helpers/ui_dimens.dart';
import 'package:size_setter/size_setter.dart';

class CommonDocumentCard extends StatelessWidget {
  const CommonDocumentCard({super.key, this.title, this.image});
  final String? title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey),
          borderRadius:
              const BorderRadius.all(Radius.circular(UIDimens.size10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Container(
                  height: 150.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(UIDimens.size10)),
                    image: DecorationImage(
                        image: AssetImage(image ?? AppAssets.documentBgRemove),
                        fit: BoxFit.fitHeight),
                  )),
              const HeightSpaceBox(size: 10),
              Text(
                title!,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
