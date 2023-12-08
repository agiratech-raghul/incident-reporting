import 'package:flutter/material.dart';
import 'package:incident_reporting/src/routing/route_constants.dart';
import 'package:incident_reporting/src/services/connectivity_service_provider.dart/check_internet_connectivity.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';
import 'package:incident_reporting/src/utils/src/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:size_setter/size_setter.dart';

class CommonScaffold extends StatefulWidget {
  const CommonScaffold(
      {super.key,
      this.body,
      this.title,
      this.bottomNavigationBar,
      this.isFlow = false,
      this.backgroundColor});
  final Widget? body;
  final String? title;
  final bool? isFlow;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  @override
  State<CommonScaffold> createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold> {
  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)?.settings.name;
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      bottomNavigationBar: widget.isFlow!
          ? route != RouteConstants.thirdScreen
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            backgroundColor: AppColors.primaryColor),
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
                          } else if (route == RouteConstants.otherInfoScreen) {
                            Navigator.pushNamed(
                                context, RouteConstants.lastScreen);
                          } else if (route == RouteConstants.lastScreen) {
                            Navigator.pushNamed(
                                context, RouteConstants.signatureScreen);
                          }
                        },
                        child: Consumer<InternetConnectionProvider>(
                          builder: (context, connectionProvider, _) {
                            if (connectionProvider.isConnected) {
                              return  Text(
                               route== RouteConstants.signatureScreen ?"Finish": 'Next',
                                style: TextStyle(color: Colors.white,fontSize: 15),
                              );
                            } else {
                              return const Text(
                                  'Disconnected from the Internet',
                                  style: TextStyle(color: Colors.white));
                            }
                          },
                        ),
                      )))
              : widget.bottomNavigationBar
          : null,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: widget.isFlow!
                ? AppColors.appScaffoldColor
                : AppColors.primaryColor),
        centerTitle: true,
        elevation: 0,
        backgroundColor: widget.isFlow!
            ? AppColors.primaryColor
            : AppColors.appScaffoldColor,
        leading: widget.isFlow!
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
        title: widget.isFlow!
            ? Text(
                widget.title!,
                textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
              )
            : Image.asset(
                AppAssets.appLogo,
                height: Utils.getScreenHeight(context, 50),
                fit: BoxFit.fitHeight,
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
      body: widget.body,
    );
  }
}
