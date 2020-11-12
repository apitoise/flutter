import 'package:flutter/material.dart';

void main() => runApp(MyBouboul());

class MyBouboul extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'magicbouboul', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _createMagic() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
          backgroundColor: Colors.green,
          appBar: AppBar(
              backgroundColor: Colors.purple,
              title:
                  Text("IT'S MAGIC", style: TextStyle(color: Colors.yellow))),
          body: Container(
              child: Center(
                  child: Text("AVADA KEDAVRA !!",
                      style: TextStyle(color: Colors.black)))));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
            title:
                Text("MAGIC BOUBOUL", style: TextStyle(color: Colors.yellow)),
            backgroundColor: Colors.purple),
        body: Container(
            child: Center(
                child: Text("Press the button and let the magic beggin !"))),
        floatingActionButton: FloatingActionButton(
            onPressed: _createMagic,
            backgroundColor: Colors.grey,
            child: Icon(Icons.electric_bike)));
  }
}
