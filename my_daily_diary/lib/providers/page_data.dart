import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/chapter.dart';

import 'package:my_daily_diary/models/page.dart';

class PageData with ChangeNotifier {
  late Chapter _chapter;
  // late ChapterPage _newPage;
  late ChapterPage _currentPage;
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

  // Color _currentColor = Colors.black;
  // TextAlign _textAlign = TextAlign.left;
  // bool _fontweight = false;
  // bool _fontStyle = false;
  // String _dropdownValue = 'lato';

  List<ChapterPage> get items {
    return [..._items];
  }

  void addPage({
    required String name,
    required Color color,
    File? image,
  }) {
    final _newPage = ChapterPage(
      id: DateTime.now().toString(),
      name: name,
      date: DateTime.now(),
      customColor: color,
      image: image,
      writingArea: [
        {'title': ''},
        {'content': ''},
      ],
      currenTextColor: Colors.black,
      textAlign: TextAlign.left,
      fontweight: false,
      fontStyle: false,
      fontName: 'lato',
      isSelected1: [true, false, false],
      isSelected2: [false, false],
    );
    // _items.add(page);
    _chapter.pages!.add(_newPage);
    // _newPage = page;
    notifyListeners();
  }

  void removePage(String? id) {
    // _items.removeWhere((page) => page.id == id);
    _chapter.pages!.removeWhere((page) => page.id == id);
    notifyListeners();
  }

  void setPages(List<ChapterPage> pages, Chapter chapter) {
    _items = pages;
    _chapter = chapter;
    notifyListeners();
  }

  void currentPage(String id) {
    _currentPage = _items.firstWhere((page) => page.id == id);
    notifyListeners();
  }

  void setCurrentColor(Color currentColor) {
    // _currentColor = currentColor;
    _currentPage.currenTextColor = currentColor;
    notifyListeners();
  }

  Color get currentColor {
    // return _currentColor;
    return _currentPage.currenTextColor;
  }

  void setTextAlign(TextAlign textAlign) {
    // _textAlign = textAlign;
    _currentPage.textAlign = textAlign;
    notifyListeners();
  }

  TextAlign get textAlign {
    // return _textAlign;
    return _currentPage.textAlign;
  }

  void setFontweight() {
    // _fontweight = !_fontweight;
    _currentPage.fontweight = !_currentPage.fontweight;
    notifyListeners();
  }

  bool get fontWeight {
    // return _fontweight;
    return _currentPage.fontweight;
  }

  void setFontStyle() {
    // _fontStyle = !_fontStyle;
    _currentPage.fontStyle = !_currentPage.fontStyle;
    notifyListeners();
  }

  bool get fontStyle {
    // return _fontStyle;
    return _currentPage.fontStyle;
  }

  void setFontName(String fontName) {
    // _dropdownValue = fontName;
    _currentPage.fontName = fontName;
    notifyListeners();
  }

  String get fontName {
    // return _dropdownValue;
    return _currentPage.fontName;
  }
}
