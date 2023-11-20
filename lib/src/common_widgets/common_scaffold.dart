import 'package:flutter/material.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({super.key, this.body, this.title});
  final Widget? body;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)?.settings.name;
    print(route);
    return Scaffold(
      bottomNavigationBar: route != RouteConstants.secondScreen
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        print(route);
                        if (route == RouteConstants.initialScreen) {
                          Navigator.pushNamed(
                              context, RouteConstants.newSecondScreen);
                        } else if (route == RouteConstants.newSecondScreen) {
                          Navigator.pushNamed(
                              context, RouteConstants.secondScreen);
                        } else if (route == RouteConstants.profileScreen) {
                          Navigator.pushNamed(
                              context, RouteConstants.otherInfoScreen);
                        }
                      },
                      child: const Text("Next Step"))))
          : null,
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
