import 'dart:io';

import 'package:flutter/material.dart';

class ChapterPage {
  String id;
  String name;
  DateTime date;
  File? image;
  Color customColor;
  // String? password;
  List<Map<String, String>> writingArea;
  Color currenTextColor;
  TextAlign textAlign;
  bool fontweight;
  bool fontStyle;
  String fontName;
  List<bool> isSelected1;
  List<bool> isSelected2;

  ChapterPage({
    required this.id,
    required this.name,
    required this.date,
    this.image,
    required this.customColor,
    // this.password,
    required this.writingArea,
    required this.currenTextColor,
    required this.textAlign,
    required this.fontweight,
    required this.fontStyle,
    required this.fontName,
    required this.isSelected1,
    required this.isSelected2,
  });
  // String id = DateTime.now().toString();
  // String name;
  // DateTime date = DateTime.now();
  // File? image;
  // Color customColor;
  // // String? password;
  // List<Map<String, String>> writingArea = [
  //   {'title': ''},
  //   {'content': ''},
  // ];
  // Color currenTextColor;
  // TextAlign textAlign;
  // bool fontweight;
  // bool fontStyle;
  // String fontName;
  // List<bool> isSelected1 = [true, false, false];
  // List<bool> isSelected2 = [false, false];

  // ChapterPage({
  //   // this.id,
  //   this.name = '',
  //   // this.date,
  //   this.image,
  //   this.customColor = Colors.cyan,
  //   // this.password,
  //   this.currenTextColor = Colors.black,
  //   this.textAlign = TextAlign.left,
  //   this.fontweight = false,
  //   this.fontStyle = false,
  //   this.fontName = 'lato',
  // });
}
