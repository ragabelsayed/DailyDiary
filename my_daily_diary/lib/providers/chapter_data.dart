import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/chapter.dart';

class ChapterData with ChangeNotifier {
  List<Chapter> _items = [
    Chapter(name: 'January', backgroundImage: 'lib/assets/images/winter.png'),
    Chapter(name: 'February', backgroundImage: 'lib/assets/images/winter.png'),
    Chapter(name: 'March', backgroundImage: 'lib/assets/images/spring.png'),
    Chapter(name: 'April', backgroundImage: 'lib/assets/images/spring.png'),
    Chapter(name: 'May', backgroundImage: 'lib/assets/images/spring.png'),
    Chapter(name: 'June', backgroundImage: 'lib/assets/images/summer.png'),
    Chapter(name: 'July', backgroundImage: 'lib/assets/images/summer.png'),
    Chapter(name: 'August', backgroundImage: 'lib/assets/images/summer.png'),
    Chapter(name: 'September', backgroundImage: 'lib/assets/images/autumn.png'),
    Chapter(name: 'October', backgroundImage: 'lib/assets/images/autumn.png'),
    Chapter(name: 'November', backgroundImage: 'lib/assets/images/autumn.png'),
    Chapter(name: 'December', backgroundImage: 'lib/assets/images/winter.png'),
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
