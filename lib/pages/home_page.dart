import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catlog/models/catlog.dart';
import 'package:flutter_catlog/widgets/drawer.dart';
import 'package:flutter_catlog/widgets/item_widget.dart';
import 'dart:convert'; // it gives decoded json data

// day 11 learn about context,constraints

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Bhushan";

  // it initialize the _HomePageState class
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsdata = decodedData["products"];
    CatlaogModel.items =
        List.from(productsdata).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catlog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatlaogModel.items != null && CatlaogModel.items!.isNotEmpty)
            ? ListView.builder(
                itemCount: CatlaogModel.items!.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: CatlaogModel.items![index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
