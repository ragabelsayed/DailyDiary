import 'package:flutter/material.dart';
import 'package:my_daily_diary/providers/diary_data.dart';

import 'package:provider/provider.dart';
import './screens/my_diary_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DiaryData(),
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
        },
      ),
    );
  }
}
