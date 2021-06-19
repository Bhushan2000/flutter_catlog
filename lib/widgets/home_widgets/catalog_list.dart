import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_catlog/models/catlog.dart';
import 'package:flutter_catlog/pages/home_details_page.dart';
import 'package:flutter_catlog/utils/routes.dart';
import 'package:flutter_catlog/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_catlog/widgets/home_widgets/catalog_image.dart';

import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20),
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
          )
        : ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final catalog = CatlaogModel.items![index];

              return InkWell(
                child: CatalogItem(catalog: catalog),
                onTap: () {
                  context.vxNav.push(
                      Uri(
                          path: MyRoutes.homeDetailsRoute,
                          queryParameters: {"id": catalog.id.toString()}),
                      params: catalog);
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
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
                AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 8.0)
          ],
        ).p(context.isMobile ? 0 : 16),
      )
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(
                    children: children2,
                  ))
        .color(context.cardColor)
        .rounded
        .square(160)
        .make()
        .py(16);
  }
}
