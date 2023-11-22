import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../buttons/common_container_button.dart';

class CommonImagePicker extends StatelessWidget {
  CommonImagePicker(
      {super.key,
      required this.fileList,
      this.videoData,
      this.isVideo = false});
  final List<File?> fileList;
  final bool? isVideo;

  File? videoData;

  final ImagePicker _Picker = ImagePicker();

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
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(color: Colors.grey),
      ),
    );
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
                      final ImagePicker imagePicker = ImagePicker();
                      XFile? file = await imagePicker.pickImage(
                          source: ImageSource.camera);
                      if (file != null) {
                        pickedFileList?.add(file);
                        fileList.add(File(file.path));
                      }
                    },
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.height / 9,
                    color: Colors.grey,
                    widget: const Icon(Icons.camera_alt_sharp, size: 35),
                  ),
                  ContainerButton(
                    onTap: () async {
                      pickedFileList = await _Picker.pickMultiImage();
                      if (pickedFileList != null) {
                        for (int i = 0; i < pickedFileList!.length; i++) {
                          fileList.add(File(pickedFileList![i]!.path));
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
