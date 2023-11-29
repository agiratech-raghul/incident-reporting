import 'package:flutter/material.dart';
import 'package:incident_reporting/src/services/connectivity_service_provider.dart/check_internet_connectivity.dart';
import 'package:provider/provider.dart';


class CheckInternetWidget extends StatefulWidget {
  const CheckInternetWidget({Key? key}) : super(key: key);

  @override
  _CheckInternetWidgetState createState() => _CheckInternetWidgetState();
}

class _CheckInternetWidgetState extends State<CheckInternetWidget> {
  CheckInternet? _checkInternet;

  @override
  void initState() {
    _checkInternet = Provider.of<CheckInternet>(context, listen: false);
    _checkInternet?.checkRealtimeConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<CheckInternet>(builder: (context, provider, child) {
          return Container(
            width: double.maxFinite,
            height: 40,
            color: provider.status == "Offline" ? Colors.red : Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(provider.status)
              ],
            ),
          );
        }),
      ],
    );
  }
}