import 'package:flutter/material.dart';
import 'package:flutter_catlog/models/catlog.dart';
import 'package:flutter_catlog/widgets/drawer.dart';
import 'package:flutter_catlog/widgets/item_widget.dart';

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
    final dumyList = List.generate(20, (index) => CatlaogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Catlog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dumyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dumyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
