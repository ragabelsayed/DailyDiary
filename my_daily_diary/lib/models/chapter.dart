import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/page.dart';
import 'package:hive/hive.dart';
// part 'chapter.g.dart';

@HiveType(typeId: 1)
class Chapter extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final File? image;

  @HiveField(3)
  final Color customColor;

  @HiveField(4)
  final List<ChapterPage> pages;
  // final String? password;
  Chapter({
    required this.id,
    required this.name,
    this.image,
    required this.customColor,
    required this.pages,
    // this.password,
  });
  // final String id = DateTime.now().toString();
  // final String name;
  // final File? image;
  // final Color customColor;
  // // final String? password;
  // final List<ChapterPage> pages = [];
  // Chapter({
  //   this.name = '',
  //   this.image,
  //   this.customColor = Colors.cyan,
  //   // this.password,
  // });
}
