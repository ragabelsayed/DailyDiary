import 'package:flutter/material.dart';
import './screens/my_diary_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyDiary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: MyDiaryScreen.routName,
      routes: {
        MyDiaryScreen.routName: (ctx) => MyDiaryScreen(),
      },
    );
  }
}
