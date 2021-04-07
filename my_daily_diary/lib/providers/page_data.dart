import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/chapter.dart';

import 'package:my_daily_diary/models/page.dart';

class PageData with ChangeNotifier {
  late Chapter _chapter;
  List<ChapterPage> _items = [];
  // [
  // ChapterPage(
  //     id: DateTime.now().toString(),
  //     name: 'January',
  //     date: DateTime.now(),
  //     backgroundImage: 'lib/assets/images/winter.png'),
  // ChapterPage(
  //     id: DateTime.now().toString(),
  //     name: 'February',
  //     date: DateTime.now(),
  //     backgroundImage: 'lib/assets/images/winter.png'),
  // ChapterPage(
  //     id: DateTime.now().toString(),
  //     name: 'March',
  //     date: DateTime.now(),
  //     backgroundImage: 'lib/assets/images/spring.png'),
  // ChapterPage(
  //     id: DateTime.now().toString(),
  //     name: 'April',
  //     date: DateTime.now(),
  //     backgroundImage: 'lib/assets/images/spring.png'),
  // ChapterPage(
  //     id: DateTime.now().toString(),
  //     name: 'May',
  //     date: DateTime.now(),
  //     backgroundImage: 'lib/assets/images/spring.png'),
  // ChapterPage(
  //     id: DateTime.now().toString(),
  //     name: 'June',
  //     date: DateTime.now(),
  //     backgroundImage: 'lib/assets/images/summer.png'),
  // ChapterPage(
  //     id: DateTime.now().toString(),
  //     name: 'July',
  //     date: DateTime.now(),
  //     backgroundImage: 'lib/assets/images/summer.png'),
  // ChapterPage(
  //     id: DateTime.now().toString(),
  //     name: 'August',
  //     date: DateTime.now(),
  //     backgroundImage: 'lib/assets/images/summer.png'),
  // ChapterPage(
  //     id: DateTime.now().toString(),
  //     name: 'September',
  //     date: DateTime.now(),
  //     backgroundImage: 'lib/assets/images/autumn.png'),
  // ChapterPage(
  //     id: DateTime.now().toString(),
  //     name: 'October',
  //     date: DateTime.now(),
  //     backgroundImage: 'lib/assets/images/autumn.png'),
  // ChapterPage(
  //     id: DateTime.now().toString(),
  //     name: 'November',
  //     date: DateTime.now(),
  //     backgroundImage: 'lib/assets/images/autumn.png'),
  // ChapterPage(
  //     id: DateTime.now().toString(),
  //     name: 'December',
  //     date: DateTime.now(),
  //     backgroundImage: 'lib/assets/images/winter.png'),
  // ];

  Color _currentColor = Colors.black;
  TextAlign _textAlign = TextAlign.left;
  bool _fontweight = false;
  bool _fontStyle = false;
  String _dropdownValue = 'lato';

  List<ChapterPage> get items {
    return [..._items];
  }

  void addPage(ChapterPage page) {
    // _items.add(page);
    _chapter.pages.add(page);
    notifyListeners();
  }

  void removePage(String? id) {
    // _items.removeWhere((page) => page.id == id);
    _chapter.pages.removeWhere((page) => page.id == id);
    notifyListeners();
  }

  void setPages(List<ChapterPage> pages, Chapter chapter) {
    _items = pages;
    _chapter = chapter;
    notifyListeners();
  }

  void setCurrentColor(Color currentColor) {
    _currentColor = currentColor;
    notifyListeners();
  }

  Color get currentColor {
    return _currentColor;
  }

  void setTextAlign(TextAlign textAlign) {
    _textAlign = textAlign;
    notifyListeners();
  }

  TextAlign get textAlign {
    return _textAlign;
  }

  void setFontweight() {
    _fontweight = !_fontweight;
    notifyListeners();
  }

  bool get fontWeight {
    return _fontweight;
  }

  void setFontStyle() {
    _fontStyle = !_fontStyle;
    notifyListeners();
  }

  bool get fontStyle {
    return _fontStyle;
  }

  void setFontName(String fontName) {
    _dropdownValue = fontName;
  }

  String get fontName {
    return _dropdownValue;
  }
}
