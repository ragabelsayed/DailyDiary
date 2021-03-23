import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/days.dart';

class DayData with ChangeNotifier {
  List<Day> _items = [
    Day(
        id: DateTime.now().toString(),
        name: 'January',
        date: DateTime.now(),
        backgroundImage: 'lib/assets/images/winter.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'February',
        date: DateTime.now(),
        backgroundImage: 'lib/assets/images/winter.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'March',
        date: DateTime.now(),
        backgroundImage: 'lib/assets/images/spring.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'April',
        date: DateTime.now(),
        backgroundImage: 'lib/assets/images/spring.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'May',
        date: DateTime.now(),
        backgroundImage: 'lib/assets/images/spring.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'June',
        date: DateTime.now(),
        backgroundImage: 'lib/assets/images/summer.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'July',
        date: DateTime.now(),
        backgroundImage: 'lib/assets/images/summer.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'August',
        date: DateTime.now(),
        backgroundImage: 'lib/assets/images/summer.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'September',
        date: DateTime.now(),
        backgroundImage: 'lib/assets/images/autumn.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'October',
        date: DateTime.now(),
        backgroundImage: 'lib/assets/images/autumn.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'November',
        date: DateTime.now(),
        backgroundImage: 'lib/assets/images/autumn.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'December',
        date: DateTime.now(),
        backgroundImage: 'lib/assets/images/winter.png'),
  ];

  List<Day> get items {
    return [..._items];
  }

  void addDay(Day day) {
    _items.add(day);
    notifyListeners();
  }

  void removeDay(String? id) {
    _items.removeWhere((day) => day.id == id);
    notifyListeners();
  }
}
