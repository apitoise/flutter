import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:tinderapp/widget/bottombuttons.dart';
import 'dart:convert';
import '../widget/appbarwidget.dart';
import '../widget/bottombuttons.dart';

int i = 12;

class SwipeView extends StatefulWidget {
  @override
  SwipeViewState createState() => SwipeViewState();
}

class SwipeViewState extends State<SwipeView> {
  String _swipeDirection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(context),
        body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/api/api.json'),
            builder: (context, snapshot) {
              var allData = json.decode(snapshot.data.toString());
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return SafeArea(
                      child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(10)),
                      Stack(children: [
                        SwipeDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10.0,
                                    offset: Offset(0.0, 1.0))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                      allData["Users"][i]["Picture"]),
                                  fit: BoxFit.cover),
                            ),
                            width: MediaQuery.of(context).size.width - 10,
                            height: MediaQuery.of(context).size.height / 1.36,
                          ),
                          onSwipeRight: () {
                            setState(() {
                              print('like');
                              _swipeDirection = "Swipe Right";
                            });
                          },
                          onSwipeLeft: () {
                            setState(() {
                              print('dislike');
                              _swipeDirection = "Swipe Left";
                            });
                          },
                          swipeConfiguration: SwipeConfiguration(
                              verticalSwipeMinVelocity: 100.0,
                              verticalSwipeMinDisplacement: 50.0,
                              verticalSwipeMaxWidthThreshold: 100.0,
                              horizontalSwipeMaxHeightThreshold: 50.0,
                              horizontalSwipeMinDisplacement: 50.0,
                              horizontalSwipeMinVelocity: 200.0),
                        ),
                        Positioned(
                            bottom: 100,
                            left: 10,
                            child: Text(
                              "${allData["Users"][i]["Name"]}, ${allData["Users"][i]["Age"].toString()}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  shadows: [
                                    Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.grey,
                                        offset: Offset(5.0, 5.0))
                                  ]),
                            )),
                        Positioned(
                            bottom: 80,
                            left: 10,
                            child: Text(
                              allData["Users"][i]["Job"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  shadows: [
                                    Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.grey,
                                        offset: Offset(5.0, 5.0))
                                  ]),
                            ))
                      ]),
                      Padding(padding: EdgeInsets.all(10)),
                      bottomButtons(),
                    ],
                  ));
                }
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
