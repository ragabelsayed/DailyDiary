import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_daily_diary/helper/box.dart';
import 'package:my_daily_diary/models/diary.dart';

class DiaryData with ChangeNotifier {
  final box = Boxes.getDiaries();
  List<Diary> _items = [];

  List<Diary> get items => [..._items];

  void getItemsFormDB() async {
    if (box.values.isNotEmpty) {
      _items = box.values.toList();
    }
    // notifyListeners();
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
    box.add(_newDiary);
    // print(box.getAt(0)!.name);
  }

  void removeDiary(Diary diary) {
    // _items.removeWhere((diary) => diary.id == id);
    _items.remove(diary);
    notifyListeners();
    diary.delete();
    // box.delete(diary.key);
  }
}
