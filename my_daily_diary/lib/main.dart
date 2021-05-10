import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/diary_screen.dart';
import 'screens/chapter_screen.dart';
import 'screens/page_screen.dart';

import 'providers/diary_data.dart';
import 'providers/chapter_data.dart';
import 'providers/page_data.dart';
import 'providers/theme.dart';

import 'models/chapter.dart';
import 'models/diary.dart';
import 'models/page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
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
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          initialRoute: DiaryScreen.routName,
          routes: {
            DiaryScreen.routName: (ctx) => DiaryScreen(),
            ChapterScreen.routName: (ctx) => ChapterScreen(),
            PageScreen.routName: (ctx) => PageScreen(),
          },
        );
      },
    );
  }
}
