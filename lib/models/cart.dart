import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catlog/core/store.dart';
import 'package:flutter_catlog/models/catlog.dart';

class CartModel {
  CatlaogModel? _catlaog;

  //collection of ID's - store ID's of each item
  final List<int> _itemId = [];

  set catalog(CatlaogModel? newCatalog) {
    _catlaog = newCatalog;
  }

  //get items in the cart
  List<Item> get items => _itemId.map((id) => _catlaog!.getByID(id)).toList();

  ///get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price!.toInt());
}

class AddMutation extends VxMutation<MyStore> {
  final Item? item;
  AddMutation(
    this.item,
  );

  @override
  perform() {
    store!.cart!._itemId.add(item!.id!.toInt());
  }
}

class ReomveMutation extends VxMutation<MyStore> {
  final Item? item;
  ReomveMutation(
    this.item,
  );

  @override
  perform() {
    store!.cart!._itemId.remove(item!.id!.toInt());
  }
}
