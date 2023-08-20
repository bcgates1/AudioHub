import 'package:audiohub/service/firebase/wishlist.dart';
import 'package:audiohub/views/common_widgets/alert_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//alternate wishlist model not using currently

class WishListCheckFirebase {
  static Future<bool> isProductInWishlist({required String productId, required context}) async {
    try {
      DocumentSnapshot wishlistSnapshot =
          await FirebaseFirestore.instance.collection('wishlists').doc(WishListFirebase.uid).get();

      if (wishlistSnapshot.exists) {
        Map<String, dynamic>? wishlistData = wishlistSnapshot.data() as Map<String, dynamic>?;
        if (wishlistData != null) {
          List<dynamic> products = wishlistData['products'];

          return products.contains(productId);
        }
      }
      return false;
    } on FirebaseException catch (e) {
      alertshower(message: e.message!, context: context);
      return false;
    }
  }
}
