// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeStyles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
     return isDarkTheme
        ? ThemeData(
                      primaryColor: Colors.black,
              primarySwatch: Colors.grey,
              brightness: Brightness.dark,
            backgroundColor:  Color(0xFF212121),
            accentColor: Color(0xff896277),
            accentIconTheme: IconThemeData(color: Colors.black),
            dividerColor: Colors.black12,
            textTheme: TextTheme(
              headline1: GoogleFonts.roboto(
                fontSize: 42,
               fontWeight: FontWeight.w600,
              ),
               headline2: GoogleFonts.roboto(
                fontSize: 28,
               fontWeight: FontWeight.w600,
              ),
               bodyText1: GoogleFonts.roboto(
                fontSize: 18 ,
               fontWeight: FontWeight.w600,
              ),

              caption: GoogleFonts.roboto(
                fontSize: 14 ,
               fontWeight: FontWeight.w600,
              ),

            ),

        ):ThemeData(
                      primaryColor: Colors.white,
              primarySwatch: Colors.orange,
                  brightness: Brightness.light,
            backgroundColor:  Colors.white,
            accentColor: Color(0xff896277),
            accentIconTheme: IconThemeData(color: Colors.white),
            dividerColor: Colors.white60,

            textTheme: TextTheme(
              headline1: GoogleFonts.roboto(
                fontSize: 42,
               fontWeight: FontWeight.w600,
              ),
               headline2: GoogleFonts.roboto(
                fontSize: 28,
               fontWeight: FontWeight.w600,
              ),
               bodyText1: GoogleFonts.roboto(
                fontSize: 18 ,
               fontWeight: FontWeight.w600,
              ),

              caption: GoogleFonts.roboto(
                fontSize: 14 ,
               fontWeight: FontWeight.w600,
              ),
            )
        );
  }
}
