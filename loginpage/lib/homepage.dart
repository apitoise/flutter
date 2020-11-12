import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'signinbutton.dart';
import 'popup.dart';
import 'signup.dart';
import 'loginscreen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  @override
  createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _password = TextEditingController();
  final _emailAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[350],
        body: Center(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'G2 CONNECT',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue),
                ),
                Image.asset('assets/images/g2logo.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 6),
                Column(children: [
                  TextField(
                      controller: _emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder())),
                  Padding(padding: EdgeInsets.all(4.0)),
                  TextField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password', border: OutlineInputBorder())),
                ]),
                FlatButton(
                    child: Text('LOG IN'),
                    color: Colors.grey[500],
                    onPressed: () async {
                      try {
                        await _auth.signInWithEmailAndPassword(
                            email: _emailAddress.text,
                            password: _password.text);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          PopUp('User not found.');
                        } else if (e.code == 'invalid-email') {
                          PopUp('Invalid email.');
                        } else if (e.code == 'wrong-password') {
                          PopUp('Wrong password.');
                        }
                      }
                    }),
                RichText(
                    text: TextSpan(
                  text: 'Forgot Password ?',
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async => await _auth.sendPasswordResetEmail(
                        email: _emailAddress.text),
                )),
                signInButton(),
                FlatButton(
                    child:
                        Text('SIGN UP', style: TextStyle(color: Colors.white)),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUp()));
                    })
              ],
            ),
          ),
        ));
  }
}
