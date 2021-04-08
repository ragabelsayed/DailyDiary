import 'dart:io';

import 'package:flutter/material.dart';

class ChapterPage {
  final String? id;
  final String? name;
  final DateTime? date;
  final String? backgroundImage;
  final File? image;
  final Color? customColor;
  final List<Map<String, String>> writingArea;
  // final String pageTitle;
  // final String pageContent;
  final String? password;

  const ChapterPage({
    this.id,
    this.name,
    this.date,
    this.backgroundImage,
    this.image,
    this.customColor,
    required this.writingArea,
    // required this.pageTitle,
    // required this.pageContent,
    this.password,
  });
}
