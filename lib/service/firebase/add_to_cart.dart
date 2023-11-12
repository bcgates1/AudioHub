import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:audiohub/service/firebase/wishlist_services.dart';
import 'package:audiohub/views/common_widgets/alert_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future addToCart({
    required String productId,
    required int quantity,
    required BuildContext context,
    bool fromCart = false,
  }) async {
    try {
      await firestore
          .collection('cart')
          .doc(FetchDataFirebase().uid)
          .collection('cartItems')
          .doc(productId)
          .set({
        'productId': productId,
        'quantity': quantity,
      }, SetOptions(merge: true)).then((value) {
        if (!fromCart) toastMessage(message: 'Added to cart');
      });
    } on FirebaseException catch (e) {
      alertshower(message: e.message!, context: context);
    }
  }

  Future removeFromCart({required String productId, required BuildContext context}) async {
    try {
      await firestore
          .collection('cart')
          .doc(FetchDataFirebase().uid)
          .collection('cartItems')
          .doc(productId)
          .delete()
          .then((value) => toastMessage(message: 'Removed from cart'));
    } on FirebaseException catch (e) {
      alertshower(message: e.message!, context: context);
    }
  }

  Future clearCart() async {
    try {
      // await firestore.collection('cart').doc(WishListFirebase.uid).delete();
      await firestore
          .collection('cart')
          .doc(FetchDataFirebase().uid)
          .collection('cartItems')
          .get()
          .then((snapshot) => snapshot.docs.forEach((doc) => doc.reference.delete()));
    } on FirebaseException catch (e) {
      toastMessage(message: e.message!);
    }
  }
}
