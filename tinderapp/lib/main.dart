import 'package:flutter/material.dart';
import 'package:tinderapp/providers/apiProvider.dart';
import 'package:tinderapp/views/swipeview.dart';
import 'views/homepage.dart';
import 'package:provider/provider.dart';
import 'views/swipeview.dart';
import 'providers/apiProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TinderLike',
      initialRoute: '/',
      routes: {
        '/': (context) {
          return ChangeNotifierProvider(
              create: (_) => ApiProvider(), child: MyHomePage());
        },
        '/swipeview': (context) => SwipeView()
      },
    );
  }
}
