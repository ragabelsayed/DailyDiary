import 'dart:io';

import 'package:flutter/material.dart';

class Chapter {
  final String name;
  final String backgroundImage;
  final File image;
  final Color customColor;
  final String password;
  const Chapter(
      {this.name,
      this.backgroundImage,
      this.image,
      this.customColor,
      this.password});
}
