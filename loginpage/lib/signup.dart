import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'popup.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _newEmailAddress = TextEditingController();
  final _newPassword = TextEditingController();

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
                      Text(
                        'CREATE USER',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue),
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextField(
                                    controller: _newEmailAddress,
                                    decoration: InputDecoration(
                                        labelText: 'Email',
                                        border: OutlineInputBorder())),
                                SizedBox(height: 20),
                                TextField(
                                    controller: _newPassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        border: OutlineInputBorder())),
                                FlatButton(
                                  child: Text('SIGN UP',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      try {
                                        await _auth
                                            .createUserWithEmailAndPassword(
                                                email: _newEmailAddress.text,
                                                password: _newPassword.text);
                                        Navigator.of(context).pop();
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'invalid-email') {
                                          PopUp('Invalid email.');
                                        } else if (e.code ==
                                            'email-already-in-use') {
                                          PopUp('Email already in use.');
                                        } else if (e.code == 'weak-password') {
                                          PopUp('Weak password');
                                        }
                                      }
                                    }
                                  },
                                  color: Colors.blue,
                                ),
                                FlatButton(
                                    child: Text('BACK',
                                        style: TextStyle(color: Colors.white)),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    color: Colors.blue)
                              ]))
                    ]))));
  }
}
