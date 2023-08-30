class BuyNow {
  static String? name;
  static int? price;
  static int? quantity;
  static String? image;
  static String? productId;

  static Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
      'image': image,
    };
  }
}
