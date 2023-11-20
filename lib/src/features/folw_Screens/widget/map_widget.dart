import 'package:flutter/material.dart';
import 'package:incident_reporting/src/common_widgets/src/images/common_network_image.dart';
import 'package:incident_reporting/src/ui_utils/app_assets.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                child: CommonNetworkImage(image: "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/w_2240,c_limit/GoogleMapTA.jpg",
                    placeHolder: AppAssets.sampleMaps,height: 200),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0)),),
              )),
          Expanded(
              flex: 2,
              child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),),),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Address :'),
                        Text(
                            '#36/ 2B, Ground Floor, Mount Poonamalle High Rd, St.Thomas Mount, Tamil Nadu 600016.',
                            textAlign: TextAlign.justify),
                        Text('LandMark  : near s.t thomas mount')
                      ],
                    ),
                  ))),
        ],
      ),
    );
  }
}
