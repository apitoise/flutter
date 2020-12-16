import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/tinderModel.dart';

class ApiProvider extends ChangeNotifier {
  String _gender;

  TinderModel fetchTinderModel() {
    final response = 'assets/api/api.json';
    return (TinderModel.fromJson(json.decode(response)));
  }

  String get getGender => _gender;
  set setGender(String gender) {
    _gender = gender;
    print(_gender);
  }
}
