import 'package:flutter_catlog/models/catlog.dart';

class CartModel {
  ////////////////////// singleton class it produce only one object
  static final cartModel = CartModel._internal();

  // constructor
  CartModel._internal();

  factory CartModel() => cartModel;

  ////////////////// singleton class /////////////////
  ///
   
   

  CatlaogModel? _catlaog;

  //collection of ID's - store ID's of each item
  final List<int> _itemId = [];

//get catalog
  CatlaogModel? get catalog => _catlaog;

  set catalog(CatlaogModel? newCatalog) {
     
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
