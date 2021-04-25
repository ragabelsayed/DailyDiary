import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:my_daily_diary/providers/chapter_data.dart';
import 'package:my_daily_diary/providers/diary_data.dart';
import 'package:my_daily_diary/providers/page_data.dart';
import 'package:my_daily_diary/screens/chapter_screen.dart';

import 'package:provider/provider.dart';
import './screens/my_diary_screen.dart';

import 'models/chapter.dart';
import 'models/diary.dart';
import 'models/page.dart';
import 'screens/page_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive
    ..registerAdapter(DiaryAdapter())
    ..registerAdapter(ChapterAdapter())
    ..registerAdapter(ChapterPageAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DiaryData(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChapterData(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageData(),
        ),
      ],
      child: MaterialApp(
        title: 'MyDiary',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: UserColorPicker(),
        initialRoute: MyDiaryScreen.routName,
        routes: {
          MyDiaryScreen.routName: (ctx) => MyDiaryScreen(),
          ChapterScreen.routName: (ctx) => ChapterScreen(),
          PageScreen.routName: (ctx) => PageScreen(),
        },
      ),
    );
  }
}
