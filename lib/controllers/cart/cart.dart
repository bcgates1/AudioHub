import 'dart:developer';

import 'package:audiohub/service/firebase/add_to_cart.dart';
import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  num price = 0;
  int quantity = 0;
  num totalPrice = 0;
  Map cartQuantity = {};
  Map allProduct = {};

  increment({required int index}) async {
    cartQuantity[index]['quantity']++;
    await findtotal();

    notifyListeners();
  }

  decrement({required int index}) async {
    if (quantity > 1) {
      cartQuantity[index]['quantity']--;
      await findtotal();

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
      // log(cartQuantity.toString());
      await findtotal();
      return false;
    }
    return true;
  }

  deleteitem({required int index}) async {
    cartQuantity.remove(index);
    initializeAll();
    notifyListeners();
  }

  findtotal() async {
    totalPrice = 0;
    for (int i = 0; i < cartQuantity.length; i++) {
      final data = await FetchDataFirebase.fetchProductWithId(
        productId: cartQuantity.values.toList()[i]['productId'],
      );
      price = data!['price'];
      quantity = cartQuantity.values.toList()[i]['quantity'];
      totalPrice += price * quantity;
      allProduct[i] = data;
    }
    log(allProduct.toString());
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
