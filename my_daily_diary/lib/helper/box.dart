import 'package:hive/hive.dart';
import 'package:my_daily_diary/models/diary.dart';

class Boxes {
  static Box<Diary> getDiaries() => Hive.box<Diary>('diaries');
}
