import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_holy_quran/darkThemeController/darkThemeprovider.dart';



class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 08,
      height: MediaQuery.of(context).size.height,
      child: Material(
        color: themeChange.darkTheme ? Colors.grey[800] : Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Switch(
                    value: themeChange.darkTheme,
                    onChanged: (value) {
                      themeChange.darkTheme = value;
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}