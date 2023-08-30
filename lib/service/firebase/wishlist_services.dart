import 'package:audiohub/views/common_widgets/alert_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WishListFirebase {
  static String uid = FirebaseAuth.instance.currentUser!.uid;

  static final DocumentReference _wishlistRef =
      FirebaseFirestore.instance.collection('wishlists').doc(uid);

  static addWishList({required String productId, required BuildContext context}) async {
    try {
      // Check if the document exists before updating
      DocumentSnapshot wishlistSnapshot = await _wishlistRef.get();

      if (wishlistSnapshot.exists) {
        // If the document exists, update the existing array
        await _wishlistRef.update(
          {
            'products': FieldValue.arrayUnion([productId]),
          },
        );
      } else {
        // If the document doesn't exist, create it with the initial array
        await _wishlistRef.set({
          'products': [productId],
        });
      }

      return true;
    } on FirebaseException catch (e) {
      alertshower(message: e.message!, context: context);
      return false;
    }
  }

  static Future<bool> removeProduct(
      {required String productId, required BuildContext context}) async {
    try {
      // Check if the document exists before updating
      DocumentSnapshot wishlistSnapshot = await _wishlistRef.get();

      if (wishlistSnapshot.exists) {
        // If the document exists, update the existing array
        await _wishlistRef.update(
          {
            'products': FieldValue.arrayRemove([productId]),
          },
        );
      } else {
        // If the document doesn't exist, show an error (since there's nothing to remove)
        alertshower(message: "Wishlist not found.", context: context);
        return false;
      }

      return true;
    } on FirebaseException catch (e) {
      alertshower(message: e.message!, context: context);
      return false;
    }
  }
}
