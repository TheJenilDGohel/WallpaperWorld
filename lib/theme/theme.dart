import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        backgroundColor: Vx.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
      );

  static Color orange = Vx.hexToColor("#ffa31a");
  static Color platinumGrey = Vx.hexToColor("#e5e4e2");
  static Color darkGrey = Vx.hexToColor("#292929");
  static Color baseBlack = Vx.hexToColor("#1b1b1b");
}
