import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_picker.dart';

class CarView extends StatefulWidget {
  const CarView({
    super.key,
    this.title,
  });
  final String? title;
  @override
  State<CarView> createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  final ImagePicker _picker = ImagePicker();
  Uint8List? signatureImage;
  XFile? file;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 130,
      child: Stack(
        fit: StackFit.expand,
        children: [
          file == null
              ? GestureDetector(
                  onTap: () {
                    showMediaType(
                      context,
                      () async {
                        Navigator.pop(context);
                        XFile? files =
                            await _picker.pickImage(source: ImageSource.camera);
                        if (files != null) {
                          setState(() {
                            file = files;
                          });
                        }
                      },
                      () async {
                        XFile? pickedFileList;
                        Navigator.pop(context);
                        pickedFileList = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (pickedFileList != null) {
                          setState(() {
                            file = pickedFileList;
                          });
                        }
                      },
                    );
                  },
                  child: Image.network(widget.title ?? '', fit: BoxFit.cover))
              : SizedBox(
                  width: double.infinity,
                  child: Image.file(
                    File(file!.path),
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
          if (file != null)
            Positioned(
                top: -10,
                right: -10,
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        file = null;
                      });
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    )))
        ],
      ),
    );
  }
}
