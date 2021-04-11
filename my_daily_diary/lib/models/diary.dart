import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/chapter.dart';

class Diary {
  final String id = DateTime.now().toString();
  final String name;
  final File? image;
  final Color customColor;
  final List<Chapter> chapters = [];
  // final String? password;
  Diary({
    this.name = '',
    this.image,
    this.customColor = Colors.cyan,
    // this.password,
  });
}
