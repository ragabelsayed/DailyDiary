import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(),
    // scaffoldBackgroundColor: Colors.grey.shade900,
    // scaffoldBackgroundColor: Colors.black,
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: Colors.brown,
    //   foregroundColor: Colors.amber,
    // ),
    // appBarTheme: AppBarTheme(backgroundColor: Colors.black12),
    // primaryColor: Colors.black,
  );
}
