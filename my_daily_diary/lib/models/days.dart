import 'dart:io';

import 'package:flutter/material.dart';

class Day {
  final String? id;
  final String? name;
  final DateTime? date;
  final String? backgroundImage;
  final File? image;
  final Color? customColor;
  final String? password;
  const Day({
    this.id,
    this.name,
    this.date,
    this.backgroundImage,
    this.image,
    this.customColor,
    this.password,
  });
}
