import 'package:flutter/material.dart';

class CommonDetailsCard extends StatelessWidget {
   const CommonDetailsCard({super.key, this.isDriver=false});
  final bool isDriver;

   @override
   Widget build(BuildContext context) {
     return Card(
       shape: Border.all(color: Colors.black12,
       ),
       margin: EdgeInsets.all(9),
       child: Container(
         padding: EdgeInsets.all(8),
         height: 260,
         width: 250,
         child: Column(
           children: [
             ElevatedButton.icon(
               icon: Icon(Icons.add),
                 onPressed: () {},
                 style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all<Color>(Colors.lime),
                 ),
                 label:  Text(isDriver?"add Driver ID- Image":"add Passenger ID- Image")),
            const Row(
                 children: <Widget>[
                   Expanded(
                       child: Divider()
                   ),

                   Text("OR"),

                   Expanded(
                       child: Divider()
                   ),
                 ]
             ),
             TextField(
               enabled: true,
               decoration: InputDecoration(
                 label: Text("Name")
               ),
             ),
             TextField(
               decoration: InputDecoration(
                   label: Text("Email")
               ),
             ),
             TextField(
               decoration: InputDecoration(
                   label: Text("Phone Number")
               ),
             ),

           ],
         ),
       ),
     );
   }
 }
