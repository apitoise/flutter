import 'package:flutter/material.dart';

Widget appBarWidget(context) {
  return AppBar(
    leading: Container(),
    backgroundColor: Colors.white,
    elevation: 0,
    actions: [
      SizedBox(
          width: MediaQuery.of(context).size.width,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
                icon: Icon(Icons.person, color: Colors.grey), onPressed: null),
            Text("TinderLike",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                )),
            IconButton(
                icon: Icon(Icons.message, color: Colors.grey), onPressed: null)
          ]))
    ],
  );
}
