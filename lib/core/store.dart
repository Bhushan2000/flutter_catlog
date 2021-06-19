import 'package:flutter_catlog/models/cart.dart';
import 'package:flutter_catlog/models/catlog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatlaogModel? catalog;
  CartModel? cart;

  // constructor
  MyStore() {
    catalog = CatlaogModel();
    cart = CartModel();
    cart!.catalog = catalog;
  }
}
