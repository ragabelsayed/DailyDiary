import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/diary.dart';

class DiaryData with ChangeNotifier {
  List<Diary> _items = [
    Diary(
      // id: DateTime.now().toString(),
      name: '2020',
      customColor: Colors.amber,
      // chapters: [],
    ),
  ];

  List<Diary> get items {
    return [..._items];
  }

  void addDiary({
    required String name,
    required Color color,
    File? image,
  }) {
    final _newDiary = Diary(
      id: DateTime.now().toString(),
      name: name,
      customColor: color,
      image: image,
      chapters: [],
    );
    _items.add(_newDiary);
    notifyListeners();
  }

  void removeDiary(String? id) {
    _items.removeWhere((diary) => diary.id == id);
    notifyListeners();
  }
}
