import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:my_daily_diary/models/chapter.dart';
import 'package:hive/hive.dart';
part 'diary.g.dart';

@HiveType(typeId: 0)
class Diary extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final File? image;

  @HiveField(3)
  final Color customColor;

  @HiveField(4)
  final List<Chapter> chapters;

  @HiveField(5)
  final bool onClickDiary;
  // final String? password;
  Diary({
    required this.id,
    required this.name,
    this.image,
    required this.customColor,
    required this.chapters,
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
