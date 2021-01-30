import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Diary {
  String id;
  String name;
  String image;
  Color customColor;
  String password;

  Diary({this.id, this.name, this.image, this.customColor, this.password});

  static List<Diary> diaryData = [
    Diary(
      id: DateTime.now().toString(),
      name: '2020',
      customColor: Colors.amber,
    ),
  ];
}
