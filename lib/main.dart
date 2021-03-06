import 'package:flutter/material.dart';
import 'package:flutter_catlog/pages/home_page.dart';
import 'package:flutter_catlog/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context basically a piece of info. that gives the position of widget inside widget tree.

    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        primarySwatch: Colors
            .deepPurple, // It adjust the all other widget colors according to deepPurple
        fontFamily: GoogleFonts.lato().fontFamily,
      ),

      initialRoute: "/Login", //by default it is "/" but you can
      routes: {
        // by default route is => "/" but if you already declare "Page" in MaterialApp() widget and here also then it gives error
        // you can either give default route here or inside MaterialApp() widget
        // if both declare then it gives error

        "/": (context) => HomePage(), // by default
        "/Login": (context) => LoginPage(),
      },
    );
  }

  // bringVegitables({@required bool thaila = false, int rupees = 100}) {
  //   // this an example of method
  //   // inside this curly braces it is optional
  //   // when we call this method anywhere then,the parameter is not give compulsory then it assume it as default i.e., the values inside curly braces
  //   // if @required is given then only we need to give parameter value when method is called.

  // }
}
