import 'package:flutter/material.dart';
import 'package:flutter_catlog/models/catlog.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item? catalog;

  const HomeDetailsPage({Key? key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColour,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH8,
          children: [
            "\$${catalog!.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishColour),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                ),
              ),
              child:"Add To Cart".text.make(),
            ).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog!.id.toString()),
              child: Image.network(
                catalog!.image.toString(),
              ),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog!.name!.text.xl4
                        .color(MyTheme.darkBluishColour)
                        .bold
                        .make(),
                    catalog!.desc!.text.xl.make(),
                    10.heightBox, // sizebox
                    "Occaecat voluptate proident voluptate ut aute in proident.Sunt et laborum minim exercitation elit."
                        .text
                        .make()
                        .p16()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
