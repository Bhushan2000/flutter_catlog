class CatlaogModel {
  static List<Item>? items;
}

class Item {
  final int? id;
  final String? name;
  final String? desc;
  final num? price;
  final String? color;
  final String? image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});

  // it gives
  // Error=> All final variables must be initialized, but 'color', 'desc', and 4 others aren't.
  //Try adding initializers for the fields
  //therefore we add factory constructor
  factory Item.fromMap(Map<dynamic, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}
