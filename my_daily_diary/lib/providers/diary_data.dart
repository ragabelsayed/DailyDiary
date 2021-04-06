import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/diary.dart';

class DiaryData with ChangeNotifier {
  List<Diary> _items = [
    Diary(
      id: DateTime.now().toString(),
      name: '2020',
      customColor: Colors.amber,
      chapters: [],
    ),
  ];

  List<Diary> get items {
    return [..._items];
  }

  void addDiary(Diary diary) {
    _items.add(diary);

    notifyListeners();
  }

  void removeDiary(String? id) {
    _items.removeWhere((diary) => diary.id == id);
    notifyListeners();
  }
}
