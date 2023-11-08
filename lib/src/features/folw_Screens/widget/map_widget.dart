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
      child: Expanded(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.red),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: TextFormField(
                    maxLines: 10,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
