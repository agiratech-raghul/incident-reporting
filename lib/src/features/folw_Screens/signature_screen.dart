import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/common_widgets/signature_pad.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_picker.dart';

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({super.key});

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  Uint8List? signatureImage;
  List<File?>? fileList = [];
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isFlow: true,
      title: "last Step",
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (fileList!.isNotEmpty) ...[
                        Image.file(
                          fileList![0]!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ],
                      Center(
                        child: CommonImagePicker(
                          fileList: fileList,
                          widget: Text(
                              fileList!.isNotEmpty
                                  ? "Change Your Selfie"
                                  : "Add Your Selfie",
                              style: const TextStyle(fontSize: 25)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (signatureImage != null)
                          Image.memory(
                            signatureImage!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                        Center(
                          child: TextButton(
                            onPressed: () async {
                              signatureImage = await showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                  content: SignaturePad(),
                                  contentPadding: EdgeInsets.zero,
                                ),
                              );
                              setState(() {});
                            },
                            child: Text(
                              signatureImage != null
                                  ? 'Change Your Signature'
                                  : 'Add Your Signature',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
