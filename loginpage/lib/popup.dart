import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  String _errorName;
  PopUp(_errorName);
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(_errorName, textAlign: TextAlign.center),
        actions: <Widget>[
          FlatButton(
              child: Text('OK'),
              color: Colors.blue,
              onPressed: () => Navigator.of(context).pop())
        ]);
  }
}