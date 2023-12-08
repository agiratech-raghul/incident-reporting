import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

class SignaturePad extends StatefulWidget {
  const SignaturePad({Key? key}) : super(key: key);

  @override
  State<SignaturePad> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignaturePad> {
  SignatureController signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Signature(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                controller: signatureController,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              padButtonOption(
                  Colors.red.shade400, 'Clear', () {
                signatureController.clear();
              }),
              padButtonOption(Colors.greenAccent.shade400, 'Done', () async {
                if (signatureController.isNotEmpty) {
                  final signature = await exportSignature();
                  if (signature.isNotEmpty) {
                    Navigator.pop(context, signature);
                  }
                }
              }),
            ],
          ),
        ],
      ),
    );
  }

  Future<Uint8List> exportSignature() async {
    final exportController = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
      points: signatureController.points,
    );

    final signature = await exportController.toPngBytes();
    exportController.dispose();
    return signature!;
  }

  ElevatedButton padButtonOption(
      Color btnClr, String btnTxt, Function() btnOnTapAction) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
            backgroundColor: MaterialStateProperty.all(btnClr),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10)),
            textStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 14, color: Colors.white))),
        onPressed: btnOnTapAction,
        child: Text(btnTxt,style: TextStyle(color: Colors.white),));
  }

  Future<File> bitsToFile(Uint8List? signatureImage) async {
    Directory? external = await getTemporaryDirectory();
    File file = File(('${external.path}/image.png'));
    file.writeAsBytes(signatureImage!);
    print(file.path);
    return file;
  }
}
