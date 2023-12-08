import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

import '../buttons/common_container_button.dart';

class CommonImagePicker extends StatefulWidget {
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

  @override
  State<CommonImagePicker> createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  final ImagePicker _Picker = ImagePicker();

  final textRecognizer = TextRecognizer();

  List<XFile?>? pickedFileList = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
         
        //   if (!widget.isVideo!) {
        // showMediaType(context,() async {
        //               Navigator.pop(context);
        //               XFile? file =
        //                   await _Picker.pickImage(source: ImageSource.camera);
        //               if (file != null) {
        //                 pickedFileList?.add(file);
        //                 widget.fileList?.add(File(file.path));
        //               }
                     
        //             });
         
        //   } else {
        //     final data = await _Picker.pickVideo(source: ImageSource.gallery);
        //     if (data != null) {
        //       widget.videoData = File(data.path);
        //     }
        //   }
          
        },
        child: widget.widget);
  }

}

 void showMediaType(BuildContext context,VoidCallback camOn,VoidCallback galOn) {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text("Select Media Type"),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerButton(
                    onTap: camOn,
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.height / 9,
                    color: Colors.grey,
                    widget: const Icon(Icons.camera_alt_sharp, size: 35),
                  ),
                  ContainerButton(
                    onTap: galOn,
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.height / 9,
                    color: Colors.grey,
                    widget: const Icon(Icons.image_sharp, size: 35),
                  ),
                ],
              ),
            )));
 }
