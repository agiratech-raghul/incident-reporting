import 'package:flutter/material.dart';

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
                decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(color: Colors.black26)),
              )),
          Expanded(
              flex: 2,
              child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black26)),
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
