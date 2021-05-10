import 'dart:io';

import 'package:flutter/material.dart';
import '../helper/box.dart';
import '../models/chapter.dart';

import '../models/page.dart';

class PageData with ChangeNotifier {
  final pagesBox = Boxes.getPagesBox();
  late Chapter _chapter;
  late ChapterPage _currentPage;
  List<ChapterPage> _items = [];

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
    _items.add(_newPage);
    notifyListeners();

    pagesBox.add(_newPage);
    _chapter.pages.add(_newPage);
    _chapter.save();
  }

  void removePage(ChapterPage page) {
    // _items.removeWhere((page) => page.id == id);
    // _chapter.pages.removeWhere((page) => page.id == id);
    _items.remove(page);
    notifyListeners();
    page.delete();
  }

  void setPages(Chapter chapter) {
    _chapter = chapter;
    _items = chapter.pages.toList();
    notifyListeners();
  }

  void currentPage(String id) {
    _currentPage = _items.firstWhere((page) => page.id == id);
    notifyListeners();
  }

  void setCurrentColor(Color currentColor) {
    _currentPage.currenTextColor = currentColor;
    notifyListeners();
    _currentPage.save();
  }

  Color get currentColor {
    return _currentPage.currenTextColor;
  }

  void setTextAlign(TextAlign textAlign) {
    _currentPage.textAlign = textAlign;
    notifyListeners();
    _currentPage.save();
  }

  TextAlign get textAlign {
    return _currentPage.textAlign;
  }

  void setFontweight() {
    _currentPage.fontweight = !_currentPage.fontweight;
    notifyListeners();
    _currentPage.save();
  }

  bool get fontWeight {
    return _currentPage.fontweight;
  }

  void setFontStyle() {
    _currentPage.fontStyle = !_currentPage.fontStyle;
    notifyListeners();
    _currentPage.save();
  }

  bool get fontStyle {
    return _currentPage.fontStyle;
  }

  void setFontName(String fontName) {
    _currentPage.fontName = fontName;
    notifyListeners();
    _currentPage.save();
  }

  String get fontName {
    return _currentPage.fontName;
  }
}
