import 'package:flutter/material.dart';
import 'package:my_daily_diary/models/days.dart';

class DayData with ChangeNotifier {
  List<Day> _items = [
    Day(
        id: DateTime.now().toString(),
        name: 'January',
        backgroundImage: 'lib/assets/images/winter.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'February',
        backgroundImage: 'lib/assets/images/winter.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'March',
        backgroundImage: 'lib/assets/images/spring.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'April',
        backgroundImage: 'lib/assets/images/spring.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'May',
        backgroundImage: 'lib/assets/images/spring.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'June',
        backgroundImage: 'lib/assets/images/summer.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'July',
        backgroundImage: 'lib/assets/images/summer.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'August',
        backgroundImage: 'lib/assets/images/summer.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'September',
        backgroundImage: 'lib/assets/images/autumn.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'October',
        backgroundImage: 'lib/assets/images/autumn.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'November',
        backgroundImage: 'lib/assets/images/autumn.png'),
    Day(
        id: DateTime.now().toString(),
        name: 'December',
        backgroundImage: 'lib/assets/images/winter.png'),
  ];

  List<Day> get items {
    return [..._items];
  }
}
