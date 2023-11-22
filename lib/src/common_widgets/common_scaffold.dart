import 'package:flutter/material.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({super.key, this.body, this.title, this.bottomNavigationBar});
  final Widget? body;
  final String? title;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)?.settings.name;
    print(route);
    return Scaffold(
      bottomNavigationBar: route != RouteConstants.thirdScreen
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondaryColor),
                      onPressed: () {
                        print(route);
                        if (route == RouteConstants.initialScreen) {
                          Navigator.pushNamed(
                              context, RouteConstants.secondScreen);
                        } else if (route == RouteConstants.secondScreen) {
                          Navigator.pushNamed(
                              context, RouteConstants.thirdScreen);
                        } else if (route == RouteConstants.thirdScreen) {
                          Navigator.pushNamed(
                              context, RouteConstants.profileScreen);
                        }else if (route == RouteConstants.profileScreen) {
                          Navigator.pushNamed(
                              context, RouteConstants.otherInfoScreen);
                        } else if (route == RouteConstants.otherInfoScreen) {
                          Navigator.pushNamed(
                              context, RouteConstants.lastScreen);
                        }
                      },
                      child: const Text("Next Step"))))
          : bottomNavigationBar,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
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
