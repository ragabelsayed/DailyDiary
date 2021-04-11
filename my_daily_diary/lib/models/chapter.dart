import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/page.dart';

class Chapter {
  final String id = DateTime.now().toString();
  final String name;
  final File? image;
  final Color customColor;
  // final String? password;
  final List<ChapterPage> pages = [];
  Chapter({
    this.name = '',
    this.image,
    this.customColor = Colors.cyan,
    // this.password,
  });
}
