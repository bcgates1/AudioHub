import 'package:flutter/material.dart';

class ProductImageProvider extends ChangeNotifier {
  int showImageindicator = 0;

  imageIndicator(int index) {
    showImageindicator = index;
    notifyListeners();
  }
}
