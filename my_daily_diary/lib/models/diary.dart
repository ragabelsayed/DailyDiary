import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/chapter.dart';

class Diary {
  final String? id;
  final String? name;
  final File? image;
  final Color? customColor;
  final List<Chapter>? chapters;
  final bool onClickDiary;
  // final String? password;
  Diary({
    this.id,
    this.name,
    this.image,
    this.customColor,
    this.chapters,
    this.onClickDiary = false,
    // this.password,
  });
  // final String id = DateTime.now().toString();
  // final String name;
  // final File? image;
  // final Color customColor;
  // final List<Chapter> chapters = [];
  // final bool onClickDiary;
  // // final String? password;
  // Diary({
  //   this.name = '',
  //   this.image,
  //   this.customColor = Colors.cyan,
  //   this.onClickDiary = false,
  //   // this.password,
  // });
}
