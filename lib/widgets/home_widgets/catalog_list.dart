import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catlog/models/cart.dart';
import 'package:flutter_catlog/models/catlog.dart';
import 'package:flutter_catlog/pages/home_details_page.dart';
import 'package:flutter_catlog/widgets/home_widgets/catalog_image.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatlaogModel.items![index];

        return InkWell(
          child: CatalogItem(catalog: catalog),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailsPage(catalog: catalog),
              ),
            );
          },
        );
      },
      itemCount: CatlaogModel.items!.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(
            image: catalog.image.toString(),
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name!.text.lg.color(context.accentColor).bold.make(),
            catalog.desc!.text.make(),
            // 10.heightBox, // sizebox
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH8,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                _AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(160).make().py(16);
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;

  const _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatlaogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;

        _cart.add(widget.catalog);

        setState(() {});
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child: isAdded ? Icon(Icons.done) : "Add To Cart".text.make(),
    );
  }
}
