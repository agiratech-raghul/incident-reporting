import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({super.key,this.body, this.title, this.onPressed});
  final Widget? body;
  final String? title;
  final VoidCallbackAction? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
    child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style:
            ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              onPressed;
              //Navigator.pushNamed(context, RouteConstants.newSecondScreen);
            },
            child: const Text("Next Step")))),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title!,
          textAlign: TextAlign.center,
        ),
      ),
      body: body,
    );
  }
}
