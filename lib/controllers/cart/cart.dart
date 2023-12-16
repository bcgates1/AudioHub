import 'package:audiohub/service/firebase/add_to_cart.dart';
import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  num price = 0;
  int quantity = 0;
  num totalPrice = 0;
  Map cartQuantity = {};
  Map allProduct = {};

  Future increment({required int index}) async {
    cartQuantity[index]['quantity']++;
    await findtotalPrice();

    notifyListeners();
  }

  Future decrement({required int index}) async {
    if (cartQuantity[index]['quantity'] > 1) {
      cartQuantity[index]['quantity']--;
      await findtotalPrice();
      notifyListeners();
    }
  }

  Future<bool> initializeAll() async {
    final snapshot = await FetchDataFirebase.cart.get();
    cartQuantity = {};
    if (snapshot.docs.isNotEmpty) {
      for (int i = 0; i < snapshot.docs.length; i++) {
        cartQuantity[i] = snapshot.docs[i].data();
      }
      await findtotalPrice();
      return false;
    }
    return true;
  }

  deleteitem({required int index}) async {
    cartQuantity.remove(index);
    await initializeAll();
    notifyListeners();
  }

  findtotalPrice() async {
    totalPrice = 0;
    for (int i = 0; i < cartQuantity.length; i++) {
      final data = await FetchDataFirebase.fetchProductWithId(
        productId: cartQuantity.values.toList()[i]['productId'],
      );
      price = data!['price'];
      quantity = cartQuantity.values.toList()[i]['quantity'];
      totalPrice += price * quantity;
      allProduct['$i'] = data;
    }
  }

  addtocart({required BuildContext context}) async {
    for (int i = 0; i < cartQuantity.length; i++) {
      await CartServices().addToCart(
        productId: cartQuantity.values.toList()[i]['productId'],
        quantity: cartQuantity.values.toList()[i]['quantity'],
        context: context,
        fromCart: true,
      );
    }
  }
}
