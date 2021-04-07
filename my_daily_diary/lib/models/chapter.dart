import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/page.dart';

class Chapter {
  final String? id;
  final String? name;
  final String? backgroundImage;
  final File? image;
  final Color? customColor;
  final String? password;
  final List<ChapterPage>? day;
  const Chapter({
    this.id,
    this.name,
    this.backgroundImage,
    this.image,
    this.customColor,
    this.password,
    this.day,
  });
}
