import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_document_card.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';
import 'package:incident_reporting/src/utils/src/helpers/ui_dimens.dart';
import 'package:size_setter/size_setter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Uint8List? signatureImage;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundColor: AppColors.appScaffoldColor,
      title: "Incident Report",
      body: SingleChildScrollView(
        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: UIDimens.size171.h,
                  width: UIDimens.size384.w,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(UIDimens.size10)),
                    image: DecorationImage(
                        image: AssetImage(AppAssets.sampleCarAccident),
                        fit: BoxFit.fitWidth),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Text(
                            //   "To restore normal service operation as quickly as possible",
                            //   style: TextStyle(
                            //     color: AppColors.lightGrey,
                            //     fontSize: 10,
                            //   ),
                            // ),
                            // const HeightSpaceBox(size: 30),
                            const Text(
                              "To minimize the negative impact of incidents by..",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  height: 1.6,
                                  color: AppColors.lightGrey),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    Navigator.of(context)
                                        .pushNamed(RouteConstants.initialScreen);
                                  },
                                  style: ButtonStyle(
                                    shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )
                              ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppColors.selectingBlue),
                                  ),
                                  child: const Text(
                                    "Report an Incident",
                                    style: TextStyle(fontSize: 16,color: Colors.white)
                                    ,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const HeightSpaceBox(size: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Text(
                      "Saved Draft",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("View All")
                ],
              ),
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, i) {
                      return const CommonDocumentCard(
                        title: "Highway Incident",
                        image: AppAssets.documentWithoutPen,
                      );
                    }),
              ),
              const HeightSpaceBox(size: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Text(
                      "Incident History",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("View All")
                ],
              ),
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return const CommonDocumentCard(
                        title: "Multi Car Collision",
                        image: AppAssets.documentBgRemove,
                      );
                    }),
              ),

              // ElevatedButton(
              //   child: const Text("Create New Incident "),
              //   onPressed: () async {
              //     Navigator.of(context).pushNamed(RouteConstants.initialScreen);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
