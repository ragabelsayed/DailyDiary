import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_daily_diary/helper/box.dart';
import 'package:my_daily_diary/models/chapter.dart';
import 'package:my_daily_diary/models/diary.dart';

class ChapterData with ChangeNotifier {
  final diaryBox = Boxes.getDiariesBox();
  final chapterBox = Boxes.getChaptersBox();
  final pageBox = Boxes.getPagesBox();
  late Diary _diary;
  List<Chapter> _items = [];
  bool _onClickDiary = false;
  //  = [
  //   Chapter(
  //       id: DateTime.now().toString(),
  //       name: 'January',
  //       backgroundImage: 'lib/assets/images/winter.png'),
  //   Chapter(
  //       id: DateTime.now().toString(),
  //       name: 'February',
  //       backgroundImage: 'lib/assets/images/winter.png'),
  //   Chapter(
  //       id: DateTime.now().toString(),
  //       name: 'March',
  //       backgroundImage: 'lib/assets/images/spring.png'),
  // Chapter(
  //     id: DateTime.now().toString(),
  //     name: 'April',
  //     backgroundImage: 'lib/assets/images/spring.png'),
  // Chapter(
  //     id: DateTime.now().toString(),
  //     name: 'May',
  //     backgroundImage: 'lib/assets/images/spring.png'),
  // Chapter(
  //     id: DateTime.now().toString(),
  //     name: 'June',
  //     backgroundImage: 'lib/assets/images/summer.png'),
  // Chapter(
  //     id: DateTime.now().toString(),
  //     name: 'July',
  //     backgroundImage: 'lib/assets/images/summer.png'),
  // Chapter(
  //     id: DateTime.now().toString(),
  //     name: 'August',
  //     backgroundImage: 'lib/assets/images/summer.png'),
  // Chapter(
  //     id: DateTime.now().toString(),
  //     name: 'September',
  //     backgroundImage: 'lib/assets/images/autumn.png'),
  // Chapter(
  //     id: DateTime.now().toString(),
  //     name: 'October',
  //     backgroundImage: 'lib/assets/images/autumn.png'),
  // Chapter(
  //     id: DateTime.now().toString(),
  //     name: 'November',
  //     backgroundImage: 'lib/assets/images/autumn.png'),
  // Chapter(
  //     id: DateTime.now().toString(),
  //     name: 'December',
  //     backgroundImage: 'lib/assets/images/winter.png'),
  // ];

  List<Chapter> get items {
    return [..._items];
  }

//  void getItemsFormDB() async {
//     if (_diary.chapters.isNotEmpty) {
//       _items = _diary.chapters.toList();
//     }
//     // notifyListeners();
//   }
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
// January - 31 days
// February - 28 days in a common year and 29 days in leap years
// March - 31 days
// April - 30 days
// May - 31 days
// June - 30 days
// July - 31 days
// August - 31 days
// September - 30 days
// October - 31 days
// November - 30 days
// December - 31 days
