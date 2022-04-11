// ignore_for_file: unused_import


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_holy_quran/darkThemeController/darkThemeprovider.dart';
import 'package:the_holy_quran/darkThemeController/themeStyle.dart';
import 'package:the_holy_quran/view/home_view.dart';
import 'package:the_holy_quran/view/onboarding.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider _darkThemeProvider = DarkThemeProvider();

  void getCurrentTheme() async {
    _darkThemeProvider.darkTheme =
        await _darkThemeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return _darkThemeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
        return MaterialApp(
          title: ' The Holy Quran',
          debugShowCheckedModeBanner: false,
          theme: ThemeStyles.themeData(_darkThemeProvider.darkTheme, context),
          home: onboardingScreen(),
        );
      }),
    );
  }


}
