import 'dart:io';
import 'package:flutter/material.dart';

import '../models/page.dart';

import 'package:hive/hive.dart';
part '../helper/chapter.g.dart';

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
  final HiveList<ChapterPage> pages;

  @HiveField(5)
  String password;

  @HiveField(6)
  bool passwordState;
  Chapter({
    required this.id,
    required this.name,
    this.image,
    required this.customColor,
    required this.pages,
    required this.password,
    this.passwordState = false,
  });
}
