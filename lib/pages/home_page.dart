import 'package:flutter/material.dart';
import 'package:flutter_catlog/widgets/drawer.dart';

// day 11 learn about context,constraints

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Bhushan";
  bool isMale = true;
  double pi = 3.142;

  // num datatype accept both int and double datatype
  num temperature = 30.5;

  // compiler auto detect the datatype of it.
  var day = "Wednesday";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catlog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days of flutter by $name"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
