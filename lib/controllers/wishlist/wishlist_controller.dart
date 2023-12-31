import 'package:audiohub/service/firebase/wishlist_services.dart';
import 'package:audiohub/views/common_widgets/alert_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WishListController extends ChangeNotifier {
  List wishList = [];

  Future getWishList() async {
    try {
      DocumentSnapshot wishlistSnapshot = await FirebaseFirestore.instance
          .collection('wishlists')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (wishlistSnapshot.exists) {
        Map<String, dynamic>? wishlistData = wishlistSnapshot.data() as Map<String, dynamic>?;
        if (wishlistData != null) {
          wishList = wishlistData['products'];
        }
      } else {
        wishList = [];
      }
    } on FirebaseException catch (e) {
      toastMessage(message: e.message!);
    }
  }

  addWishList({required String productId, required BuildContext context}) async {
    wishList.add(productId);

    bool added = await WishListFirebase.addWishList(productId: productId, context: context);
    if (added) {
      if (context.mounted) {
        snackbarMessage(message: 'Added to wishlist', context: context);
      }
    }
    notifyListeners();
  }

  deleteWishList({required String productId, required BuildContext context}) async {
    wishList.remove(productId);
    bool removed = await (WishListFirebase.removeProduct(productId: productId, context: context));
    if (removed) {
      if (context.mounted) {
        snackbarMessage(message: 'Removed from wishlist', context: context);
      }
    }
    notifyListeners();
  }
}
