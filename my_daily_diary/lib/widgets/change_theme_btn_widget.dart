import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme.dart';

class ChangeThemeButtonWidget extends StatefulWidget {
  @override
  _ChangeThemeButtonWidgetState createState() =>
      _ChangeThemeButtonWidgetState();
}

class _ChangeThemeButtonWidgetState extends State<ChangeThemeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    bool _isDarkMode = themeProvider.isDarkMode;
    return IconButton(
      icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
      onPressed: () {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(!_isDarkMode);
        setState(() {
          _isDarkMode = !_isDarkMode;
        });
      },
    );

    // Switch.adaptive(
    //   value: themeProvider.isDarkMode,
    //   onChanged: (value) {
    //     final provider = Provider.of<ThemeProvider>(context, listen: false);
    //     provider.toggleTheme(value);
    //   },

    // );
  }
}
