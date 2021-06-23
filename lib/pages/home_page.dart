import 'dart:convert'; // it gives decoded json data
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catlog/core/store.dart';
import 'package:flutter_catlog/models/cart.dart';
import 'package:flutter_catlog/utils/routes.dart';
import 'package:flutter_catlog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catlog/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catlog/models/catlog.dart';

// day 11 learn about context,constraints
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Bhushan";
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  // it initialize the _HomePageState class
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // retrive data from file
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    // retrive data from url
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;

    final decodedData = jsonDecode(catalogJson);
    var productsdata = decodedData["products"];
    CatlaogModel.items =
        List.from(productsdata).map((item) => Item.fromMap(item)).toList();

    (VxState.store as MyStore).items = CatlaogModel.items;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final MyStore store = VxState.store;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, ReomveMutation},
        builder: (ctx, s, _) => FloatingActionButton(
          onPressed: () =>
              store.navigator!.routeManager.push(Uri.parse(MyRoutes.cartRoute)),
              // Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.white,
            size: 24,
            count: store.items!.length,
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              CupertinoSearchTextField(
                onChanged: (value) {
                  SearchMutation(value);
                },
              ).py12(),
              if (CatlaogModel.items != null && CatlaogModel.items!.isNotEmpty)
                CatalogList().py16().expand() // wrap with expanded widget
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////// flutter create .  command create missing folder for that project /////////////////////////
