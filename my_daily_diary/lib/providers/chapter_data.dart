import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../helper/box.dart';
import '../models/chapter.dart';
import '../models/diary.dart';

class ChapterData with ChangeNotifier {
  final diaryBox = Boxes.getDiariesBox();
  final chapterBox = Boxes.getChaptersBox();
  final pageBox = Boxes.getPagesBox();

  late Diary _diary;
  List<Chapter> _items = [];
  bool _onClickDiary = false;

  List<Chapter> get items {
    return [..._items];
  }

  void addChapter({
    required String name,
    required Color color,
    File? image,
  }) {
    final _newChapter = Chapter(
      id: DateTime.now().toString(),
      name: name,
      customColor: color,
      image: image,
      pages: HiveList(pageBox),
    );
    _items.add(_newChapter);
    notifyListeners();
    chapterBox.add(_newChapter);
    _diary.chapters.add(_newChapter);
    _diary.save();
  }

  void removeChapter(Chapter chapter) {
    // _items.removeWhere((chapter) => chapter.id == id);
    // _diary.chapters.removeWhere((chapter) => chapter.id == id);
    _items.remove(chapter);
    notifyListeners();
    chapter.delete();
  }

  void setChapters(Diary diary) {
    _diary = diary;
    _items = diary.chapters.toList();
    notifyListeners();
  }

  void setClick(bool click) {
    _onClickDiary = click;
    notifyListeners();
  }

  bool get getClick {
    return _onClickDiary;
  }
}
