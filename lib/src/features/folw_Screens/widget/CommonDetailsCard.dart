import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_network_image.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';

class CommonDetailsCard extends StatelessWidget {
  const CommonDetailsCard({super.key, this.isDriver = false});
  final bool isDriver;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: Border.all(
        color: Colors.black12,
      ),
      color: const Color.fromRGBO(206, 227, 226, 1),
      margin: isDriver
          ? const EdgeInsets.symmetric(vertical: 10)
          : const EdgeInsets.all(9),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 260,
        width: 400,
        child: Column(
          children: [
            ElevatedButton.icon(
                icon: const Icon(Icons.add),
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                label: Text(
                  isDriver ? "add Driver ID" : "add Passenger ID",
                  textAlign: TextAlign.center,
                )),
            const Row(children: <Widget>[
              Expanded(child: Divider()),
              Text("OR"),
              Expanded(child: Divider()),
            ]),
            const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      TextField(
                        enabled: true,
                        decoration: InputDecoration(label: Text("Name")),
                      ),
                      TextField(
                        decoration: InputDecoration(label: Text("Email")),
                      ),
                      TextField(
                        decoration:
                            InputDecoration(label: Text("Phone Number")),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: FittedBox(
                      child: CommonNetworkImage(
                        height: 100,
                        width: 100,
                        image:
                            "https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/7804129/driver-clipart-md.png",
                        placeHolder: AppAssets.sampleImage,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
