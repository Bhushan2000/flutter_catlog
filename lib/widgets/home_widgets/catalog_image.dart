import 'package:flutter/material.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String? image;

  const CatalogImage({Key? key, @required this.image})
      : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image.toString(),
    ).box.rounded.p8.color(MyTheme.creamColour).make().p(16).w40(context);
  }
}
