import 'package:flutter/material.dart';

class CartQuatity extends ChangeNotifier {
  int quantity = 1;
  int cost = 0;

  void increment(int price) {
    quantity++;
    costIncrement(price);
    notifyListeners();
  }

  void decrement(int price) {
    if (quantity > 1) {
      costDecrement(price);
      quantity--;
    }
    notifyListeners();
  }

  costIncrement(int price) {
    if (cost == 0) {
      price += price;
    }
    cost += price;
  }

  costDecrement(int price) {
    cost -= price;
  }
}
