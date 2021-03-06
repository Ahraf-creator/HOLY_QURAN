import 'package:flutter/cupertino.dart';
import 'package:the_holy_quran/darkThemeController/darkthemepref.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;



  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);

    notifyListeners();
  }
}