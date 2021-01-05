import 'package:flutter/material.dart';

Widget bottomButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      FloatingActionButton(
        backgroundColor: Colors.white,
        mini: true,
        onPressed: null,
        child: Icon(Icons.loop, color: Colors.amber),
      ),
      FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: null,
          child: Icon(Icons.close, color: Colors.red)),
      FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: null,
        child: Icon(Icons.favorite, color: Colors.green),
      ),
      FloatingActionButton(
        backgroundColor: Colors.white,
        mini: true,
        onPressed: null,
        child: Icon(
          Icons.star,
          color: Colors.blue,
        ),
      )
    ],
  );
}
