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
      // wishlistRef.set({'products': productId } )

      return await _wishlistRef.update(
        {
          'products': FieldValue.arrayUnion([productId]),
        },
      ).then(
        (value) => true,
      );
    } on FirebaseException catch (e) {
      alertshower(message: e.message!, context: context);
      return false;
    }
  }

  static Future<bool> removeProduct(
      {required String productId, required BuildContext context}) async {
    try {
      return await _wishlistRef.update(
        {
          'products': FieldValue.arrayRemove([productId]),
        },
      ).then(
        (value) => true,
      );
    } on FirebaseException catch (e) {
      alertshower(message: e.message!, context: context);
      return false;
    }
  }
}
