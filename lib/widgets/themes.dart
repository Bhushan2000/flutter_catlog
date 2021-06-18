import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors
            .deepPurple, // It adjust the all other widget colors according to deepPurple
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColour,
        buttonColor: darkBluishColour,
        accentColor: darkBluishColour,

        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors
            .deepPurple, // It adjust the all other widget colors according to deepPurple
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkCreamColour,
        buttonColor: lightBluishColour,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme,
        ),
      );
  // colors
  static Color creamColour = Color(0xfff5f5f5);
  static Color darkCreamColour = Vx.gray900;

  static Color darkBluishColour = Color(0xff403b58);
  static Color lightBluishColour = Vx.indigo500;
}
