import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  //* static function for app theme
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: const Color(0xFF080C25),
        //* primary theme
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.lato().fontFamily,
        //* text theme
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Color(0xFFE5E5E5),
          ),
        ),
        //*appbar theme
        appBarTheme: const AppBarTheme(
            color: Color(0xFF161E35),
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white70),
            titleTextStyle: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 18)));
  }
}
