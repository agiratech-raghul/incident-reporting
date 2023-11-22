import 'package:flutter/material.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';

import '../features/home_screen.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold(
      {super.key,
      this.body,
      this.title,
      this.bottomNavigationBar,
      this.isFlow = false});
  final Widget? body;
  final String? title;
  final bool? isFlow;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)?.settings.name;
    return Scaffold(
      bottomNavigationBar: isFlow!
          ? route != RouteConstants.thirdScreen
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
                            } else if (route == RouteConstants.profileScreen) {
                              Navigator.pushNamed(
                                  context, RouteConstants.otherInfoScreen);
                            } else if (route ==
                                RouteConstants.otherInfoScreen) {
                              Navigator.pushNamed(
                                  context, RouteConstants.lastScreen);
                            }
                          },
                          child: const Text("Next Step"))))
              : bottomNavigationBar
          : null,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: isFlow!
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (cxt) => AlertDialog(
                      title: const Text(
                          "Do you want to save this document for use it later?"),
                      content: const Text(
                          "This document has not been sent and contains unsaved changes.you can save it as a draft to work on leter"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                RouteConstants.homeScreen, (route) => false);
                          },
                          child: const Text("Yes"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                RouteConstants.homeScreen, (route) => false);
                          },
                          child: const Text("No"),
                        )
                      ],
                    ),
                  );
                },
              )
            : null,
        title: Text(
          title!,
          textAlign: TextAlign.center,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, RouteConstants.homeScreen);
              },
            ),
            ListTile(
              leading: const Icon(Icons.drafts),
              title: const Text('Draft'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Incident History'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
