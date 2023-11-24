import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_network_image.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_picker.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/commonOptionsContainers.dart';
import 'package:incident_reporting/src/features/folw_Screens/widget/common_yes_or_no.dart';

import '../../common_widgets/signature_pad.dart';
import '../../ui_utils/app_assets.dart';

class LastScreen extends StatefulWidget {
  const LastScreen({super.key});

  @override
  State<LastScreen> createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
  Uint8List? signatureImage;
  File? videoData;
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isFlow: true,
      title: "Step 7",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ExpansionTile(
                title: Text("Weather Conditions"),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  CommonOptionsContainers(
                    option1: "☀️",
                    optionName1: "Sunny",
                    option2: "🌧️",
                    optionName2: "Rainy",
                    option3: "❄️",
                    optionName3: "Snow",
                  )
                ],
              ),
              const ExpansionTile(
                title: Text("Road Conditions"),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  CommonOptionsContainers(
                    option1: "🛣️",
                    optionName1: "Normal Road",
                    option2: "⛐",
                    optionName2: "Slippery Road",
                    option3: "🚧",
                    optionName3: "Construction",
                    option4: "🕳️",
                    optionName4: "Pot hole",
                  )
                ],
              ),
              const ExpansionTile(
                title: Text("Traffic Conditions"),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  CommonOptionsContainers(
                    option1: "🛑",
                    optionName1: "Stop Sign",
                    option2: "🏮",
                    optionName2: "Red Light",
                    option3: "⛙",
                    optionName3: "Merge",
                    option4: "🚷",
                    optionName4: "Stop Sign",
                  )
                ],
              ),
              const ExpansionTile(
                title: Text("Telematics - Dongle(s) for any vehicle"),
                trailing: SizedBox(
                  width: 140,
                  child: CommonYesOrNo(),
                ),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  TextField(
                    decoration:
                        InputDecoration(label: Text("List Names if Possible")),
                  ),
                ],
              ),

              CommonImagePicker(
                  videoData: videoData,
                  isVideo: true,
                  widget: const ListTile(
                    title: Center(child: Text("+ add your desh cam/video")),
                  )),

              // ElevatedButton(onPressed: () {}, child: const Text("data"))
              if (videoData != null)
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                "https://st2.depositphotos.com/2931363/6263/i/450/depositphotos_62630621-stock-photo-young-man-making-selfie.jpg",
                                height: 90,
                                width: 90,
                                fit: BoxFit.fill,
                              ),
                              TextButton(
                                onPressed: () async {},
                                child: const Text(
                                  'add Your Selfie',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (signatureImage != null)
                                Image.memory(
                                  signatureImage!,
                                  height: 90,
                                  width: 90,
                                  fit: BoxFit.fill,
                                ),
                              TextButton(
                                onPressed: () async {
                                  signatureImage = await showDialog(
                                    context: context,
                                    builder: (context) => const AlertDialog(
                                      content: SignatureScreen(),
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  );
                                  setState(() {});
                                },
                                child: Text(
                                  signatureImage != null
                                      ? 'Change Your Signature'
                                      : 'Add Your Signature',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ]),
      ),
    );
  }
}
