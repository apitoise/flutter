import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:provider/provider.dart';
import 'package:tinderapp/models/tinderModel.dart';
import '../providers/apiProvider.dart';

class SwipeView extends StatefulWidget {
  @override
  SwipeViewState createState() => SwipeViewState();
}

class SwipeViewState extends State<SwipeView> {
  String _swipeDirection;
  TinderModel fetchTinderModel;

  void initState() {
    super.initState();
    final provider = Provider.of<ApiProvider>(context, listen: true);
    fetchTinderModel = provider.fetchTinderModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.red, title: Text("TinderLike")),
        body: SafeArea(
            child: Column(
          children: [
            Padding(padding: EdgeInsets.all(5)),
            Center(
              child: SwipeDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width - 10,
                  height: MediaQuery.of(context).size.height / 1.40,
                  color: Colors.amber,
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
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(padding: EdgeInsets.all(20)),
                ClipOval(
                    child: Material(
                        color: Colors.red,
                        elevation: 80,
                        child: InkWell(
                            onTap: () => Navigator.pop(context),
                            splashColor: Colors.amber,
                            child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Icon(Icons.block,
                                    size: 50, color: Colors.white))))),
                ClipOval(
                    child: Material(
                        color: Colors.green,
                        elevation: 8,
                        child: InkWell(
                            onTap: () => Navigator.pop(context),
                            splashColor: Colors.blue,
                            child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 50,
                                  color: Colors.white,
                                ))))),
                Padding(padding: EdgeInsets.all(20)),
              ],
            )
          ],
        )));
  }
}
