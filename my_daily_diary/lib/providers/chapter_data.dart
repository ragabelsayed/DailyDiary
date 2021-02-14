import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/chapter.dart';

class ChapterData with ChangeNotifier {
  List<Chapter> _items = [
    Chapter(name: 'January', image: 'lib/assets/images/winter.png'),
    Chapter(name: 'February', image: 'lib/assets/images/winter.png'),
    Chapter(name: 'March', image: 'lib/assets/images/spring.png'),
    Chapter(name: 'April', image: 'lib/assets/images/spring.png'),
    Chapter(name: 'May', image: 'lib/assets/images/spring.png'),
    Chapter(name: 'June', image: 'lib/assets/images/summer.png'),
    Chapter(name: 'July', image: 'lib/assets/images/summer.png'),
    Chapter(name: 'August', image: 'lib/assets/images/summer.png'),
    Chapter(name: 'September', image: 'lib/assets/images/autumn.png'),
    Chapter(name: 'October', image: 'lib/assets/images/autumn.png'),
    Chapter(name: 'November', image: 'lib/assets/images/autumn.png'),
    Chapter(name: 'December', image: 'lib/assets/images/winter.png'),
  ];

  List<Chapter> get items {
    return [..._items];
  }

  void addItem(Chapter chapter) {
    _items.add(chapter);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
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
