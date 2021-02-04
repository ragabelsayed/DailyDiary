import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Diary {
  final String id;
  final String name;
  final File image;
  final Color customColor;
  final String password;

  Diary({this.id, this.name, this.image, this.customColor, this.password});

  static List<Diary> diaryData = [
    Diary(
      id: DateTime.now().toString(),
      name: '2020',
      customColor: Colors.amber,
    ),
  ];
}
