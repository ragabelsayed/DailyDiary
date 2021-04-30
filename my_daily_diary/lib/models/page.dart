import 'dart:io';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
part 'page.g.dart';

@HiveType(typeId: 2)
class ChapterPage extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  File? image;

  @HiveField(4)
  Color customColor;

  @HiveField(5)
  List<Map<String, String>> writingArea;

  @HiveField(6)
  Color currenTextColor;

  @HiveField(7)
  TextAlign textAlign;

  @HiveField(8)
  bool fontweight;

  @HiveField(9)
  bool fontStyle;

  @HiveField(10)
  String fontName;

  @HiveField(11)
  List<bool> isSelected1;

  @HiveField(12)
  List<bool> isSelected2;

  // String? password;
  ChapterPage({
    required this.id,
    required this.name,
    required this.date,
    this.image,
    required this.customColor,
    required this.writingArea,
    required this.currenTextColor,
    required this.textAlign,
    required this.fontweight,
    required this.fontStyle,
    required this.fontName,
    required this.isSelected1,
    required this.isSelected2,
    // this.password,
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
