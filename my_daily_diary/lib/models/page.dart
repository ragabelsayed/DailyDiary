import 'dart:io';

import 'package:flutter/material.dart';

class ChapterPage {
  final String? id;
  final String? name;
  final DateTime? date;
  final String? backgroundImage;
  final File? image;
  final Color? customColor;
  final String? password;
  final List<Map<String, String>> writingArea;
  // Color currenTextColor = Colors.black;
  // TextAlign textAlign = TextAlign.left;
  // bool fontweight = false;
  // bool fontStyle = false;
  // String fontName = 'lato';
  Color currenTextColor;
  TextAlign textAlign;
  bool fontweight;
  bool fontStyle;
  String fontName;
  // List<bool> isSelected1;
  List<bool> isSelected1 = [true, false, false];
  List<bool> isSelected2 = [false, false, false];
  // List<bool> isSelected2;
  ChapterPage({
    this.id,
    this.name,
    this.date,
    this.backgroundImage,
    this.image,
    this.customColor,
    this.password,
    required this.writingArea,
    required this.currenTextColor,
    required this.textAlign,
    required this.fontweight,
    required this.fontStyle,
    required this.fontName,
    // required this._isSelected1,
  });
}
