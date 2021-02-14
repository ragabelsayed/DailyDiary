import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/diary.dart';

class DiaryData with ChangeNotifier {
  List<Diary> _items = [
    Diary(
      id: DateTime.now().toString(),
      name: '2020',
      customColor: Colors.amber,
    ),
  ];

  List<Diary> get items {
    return [..._items];
  }

  void addItem(Diary diary) {
    _items.add(diary);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
