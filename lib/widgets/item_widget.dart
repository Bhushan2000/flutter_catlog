import 'package:flutter/material.dart';
import 'package:flutter_catlog/models/catlog.dart';

class ItemWidget extends StatelessWidget {
  final Item? item;

  const ItemWidget({Key? key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item!.name.toString()} pressed!!!!");
        },
        leading: Image.network(item!.image.toString()),
        title: Text(item!.name.toString()),
        subtitle: Text(item!.desc.toString()),
        trailing: Text(
          "\$${item!.price.toString()}",
          textScaleFactor: 1.5,
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
