import 'package:flutter_catlog/models/catlog.dart';

class CartModel {
  late CatlaogModel _catlaog;

  //collection of ID's - store ID's of each item
  final List<int> _itemId = [];

//get catalog
  CatlaogModel get catalog => _catlaog;

  set catalog(CatlaogModel newCatalog) {
    assert(catalog != null);
    _catlaog = newCatalog;
  }

  //get items in the cart
  List<Item> get items => _itemId.map((id) => _catlaog!.getByID(id)).toList();

  ///get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price!.toInt());

  // add item
  void add(Item item) {
    _itemId.add(item.id!.toInt());
  }

  // remmove itemm
  void remove(Item item) {
    _itemId.remove(item.id!.toInt());
  }
}
