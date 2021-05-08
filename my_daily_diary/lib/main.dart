import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:my_daily_diary/providers/chapter_data.dart';
import 'package:my_daily_diary/providers/diary_data.dart';
import 'package:my_daily_diary/providers/page_data.dart';
import 'package:my_daily_diary/providers/theme.dart';
import 'package:my_daily_diary/screens/chapter_screen.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  await Hive.openBox<Diary>('diaries');
  await Hive.openBox<Chapter>('chapters');
  await Hive.openBox<ChapterPage>('pages');
  var theme = await SharedPreferences.getInstance().then(
    (prefs) => ThemeMode.values.firstWhere(
      (theme) => theme.index == prefs.getInt('currentTheme'),
    ),
  );
  runApp(MyApp(theme));
}

class MyApp extends StatelessWidget {
  final ThemeMode? _currrentTheme;
  MyApp(this._currrentTheme);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              ThemeProvider(_currrentTheme ?? ThemeMode.system),
        ),
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
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'MyDiary',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          // theme: ThemeData.dark(),
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          initialRoute: MyDiaryScreen.routName,
          routes: {
            MyDiaryScreen.routName: (ctx) => MyDiaryScreen(),
            ChapterScreen.routName: (ctx) => ChapterScreen(),
            PageScreen.routName: (ctx) => PageScreen(),
          },
        );
      },
    );
  }
}
