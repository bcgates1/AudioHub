class CartModel {
  String name;
  int price;
  int quantity;
  String image;
  CartModel({required this.name, required this.price, required this.quantity, required this.image});

  Map<String, dynamic> toMap({required CartModel cartModel}) {
    return {
      'name': cartModel.name,
      'price': cartModel.price,
      'quantity': cartModel.quantity,
      'image': cartModel.image
    };
  }
}
