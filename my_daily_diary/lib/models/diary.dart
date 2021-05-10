import 'dart:io';
import 'package:flutter/material.dart';

import '../models/chapter.dart';

import 'package:hive/hive.dart';
part '../helper/diary.g.dart';

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
  final HiveList<Chapter> chapters;

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
}
