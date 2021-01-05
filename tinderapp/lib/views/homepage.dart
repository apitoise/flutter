import 'package:flutter/material.dart';
import 'package:tinderapp/views/swipeview.dart';
import 'package:tinderapp/widget/appbarwidget.dart';
import '../widget/findyourgender.dart';
import '../widget/appbarwidget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(context),
        body: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 12),
                  Image.asset('assets/tinderlogolike.png',
                      width: MediaQuery.of(context).size.width / 2),
                  SizedBox(height: MediaQuery.of(context).size.height / 15),
                  Text("Wich gender you like ?"),
                  FindYourGender(),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  RaisedButton(
                      elevation: 8,
                      color: Colors.red,
                      child: Text("Find love",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/swipeview'))
                ],
              ),
            )));
  }
}
