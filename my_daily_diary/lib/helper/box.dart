import 'package:hive/hive.dart';
import 'package:my_daily_diary/models/chapter.dart';
import 'package:my_daily_diary/models/diary.dart';
import 'package:my_daily_diary/models/page.dart';

class Boxes {
  static Box<Diary> getDiariesBox() => Hive.box<Diary>('diaries');
  static Box<Chapter> getChaptersBox() => Hive.box<Chapter>('chapters');
  static Box<ChapterPage> getPagesBox() => Hive.box<ChapterPage>('pages');
}
