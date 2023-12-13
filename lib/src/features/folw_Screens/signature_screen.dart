import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incident_reporting/src/common_widgets/common_scaffold.dart';
import 'package:incident_reporting/src/common_widgets/signature_pad.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_picker.dart';

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({super.key});

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
    final ImagePicker _Picker = ImagePicker();
  Uint8List? signatureImage;
  List<File?>? fileList = [];
  bool? isAgree=false;
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
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.file(
                              fileList![0]!,
                              height: 100,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                      Center(
                        child: TextButton(
                          onPressed: (){
                             showMediaType(context,() async {
                      Navigator.pop(context);
                      XFile? file =
                          await _Picker.pickImage(source: ImageSource.camera);
                      if (file != null) {
                        setState(() {
                        fileList?.add(File(file.path));
                          
                        });
                      }
                     
                    }, () async {
                        List<XFile?>? pickedFileList = [];
                      Navigator.pop(context);
                      pickedFileList = await _Picker.pickMultiImage();
                      if (pickedFileList != null && pickedFileList.isNotEmpty) {
                        final inputImage = InputImage.fromFile(
                            File(pickedFileList[0]!.path ?? ''));
                        // final recognizedText =
                        //     await textRecognizer.processImage(inputImage);
                        // print(recognizedText.text);
                        for (int i = 0; i < pickedFileList.length; i++) {
                          fileList?.add(File(pickedFileList[i]!.path));
                        }
                      }
                    },);
         
                          },
                          child: Text(
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
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (signatureImage != null)
                          Expanded(
                            flex: 2,
                            child: Image.memory(
                              signatureImage!,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
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
            ListTile(
              leading: Checkbox(value: isAgree, onChanged: (e){
                setState(() {
            isAgree = e;
                  
                });
              }),
              horizontalTitleGap: 0,
              title: Text("I read and accept the Privacy policy"),
            )
          ],
        ),
      ),
    );
  }
}
