import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

import '../buttons/common_container_button.dart';

class CommonImagePicker extends StatelessWidget {
  CommonImagePicker(
      {super.key,
      this.fileList,
      this.videoData,
      this.isVideo = false,
      this.widget});
  final List<File?>? fileList;
  final bool? isVideo;
  final Widget? widget;
  File? videoData;

  final ImagePicker _Picker = ImagePicker();
  final textRecognizer = TextRecognizer();

  List<XFile?>? pickedFileList = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          if (!isVideo!) {
            showMediaType(context);
          } else {
            final data = await _Picker.pickVideo(source: ImageSource.gallery);
            if (data != null) {
              videoData = File(data.path);
            }
          }
        },
        child: widget);
  }

  void showMediaType(BuildContext context) {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text("Select Media Type"),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerButton(
                    onTap: () async {
                      Navigator.pop(context);
                      final ImagePicker imagePicker = ImagePicker();
                      XFile? file = await imagePicker.pickImage(
                          source: ImageSource.camera);
                      if (file != null) {
                        pickedFileList?.add(file);
                        fileList?.add(File(file.path));
                      }
                    },
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.height / 9,
                    color: Colors.grey,
                    widget: const Icon(Icons.camera_alt_sharp, size: 35),
                  ),
                  ContainerButton(
                    onTap: () async {
                      Navigator.pop(context);
                      pickedFileList = await _Picker.pickMultiImage();
                      if (pickedFileList != null) {
                        final inputImage = InputImage.fromFile(
                            File(pickedFileList?[0]!.path ?? ''));
                        final recognizedText =
                            await textRecognizer.processImage(inputImage);
                        print(recognizedText.text);
                        for (int i = 0; i < pickedFileList!.length; i++) {
                          fileList?.add(File(pickedFileList![i]!.path));
                        }
                      }
                    },
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.height / 9,
                    color: Colors.grey,
                    widget: const Icon(Icons.image_sharp, size: 35),
                  ),
                ],
              ),
            )));
  }
}
