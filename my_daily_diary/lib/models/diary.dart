import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/chapter.dart';

class Diary {
  final String? id;
  final String? name;
  final File? image;
  final Color? customColor;
  final String? password;
  final List<Chapter> chapters;
  Diary({
    this.id,
    this.name,
    this.image,
    this.customColor,
    this.password,
    required this.chapters,
  });

  // static List<Diary> diaryData = [
  //   Diary(
  //     id: DateTime.now().toString(),
  //     name: '2020',
  //     customColor: Colors.amber,
  //   ),
  // ];
}
