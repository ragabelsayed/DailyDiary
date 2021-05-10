import 'package:hive/hive.dart';
import '../models/chapter.dart';
import '../models/diary.dart';
import '../models/page.dart';

class Boxes {
  static Box<Diary> getDiariesBox() => Hive.box<Diary>('diaries');
  static Box<Chapter> getChaptersBox() => Hive.box<Chapter>('chapters');
  static Box<ChapterPage> getPagesBox() => Hive.box<ChapterPage>('pages');
}
