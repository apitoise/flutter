import 'package:flutter/material.dart';
import 'package:tinderapp/providers/apiProvider.dart';
import 'package:provider/provider.dart';

class FindYourGender extends StatefulWidget {
  @override
  _FindYourGenderState createState() => _FindYourGenderState();
}

class _FindYourGenderState extends State<FindYourGender> {
  bool men = false;
  bool women = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProvider>(context, listen: true);
    return Container(
        width: MediaQuery.of(context).size.width / 3,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Checkbox(
                value: men,
                onChanged: (value) => setState(() {
                      men = !men;
                      provider.setGender = setGender(men, women);
                    })),
            Text("Men")
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Checkbox(
                value: women,
                onChanged: (value) => setState(() {
                      women = !women;
                      provider.setGender = setGender(men, women);
                    })),
            Text("Women")
          ]),
        ]));
  }

  String setGender(bool men, bool women) {
    if (!men && women) {
      return "Women";
    } else if (men && !women) {
      return "Men";
    } else if (men && women) {
      return "Both";
    } else {
      return "None";
    }
  }
}
