import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[350],
        body: Center(
            child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 1.6,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Welcome to the app my dude',
                        textAlign: TextAlign.center),
                    Padding(padding: EdgeInsets.all(10.0)),
                    FlatButton(
                        child: Text('LOG OUT',
                            style: TextStyle(color: Colors.white)),
                        color: Colors.blue,
                        onPressed: () => Navigator.of(context).pop())
                  ],
                ))));
  }
}