// import 'package:cloud_firestore/cloud_firestore.dart';

// class Wishlist {
//   String uid;
//   List<String> products;

//   Wishlist({this.uid, this.products = const []});

//   static Future<Wishlist> getWishlist(String uid) async {
//     var wishlistRef = FirebaseFirestore.instance.collection('wishlists').doc(uid);
//     var wishlistData = await wishlistRef.get();
//     if (wishlistData.exists) {
//       return Wishlist.fromMap(wishlistData.data());
//     } else {
//       return Wishlist(uid: uid);
//     }
//   }

//   Future<void> addProduct(String productId) async {
//     var wishlistRef = FirebaseFirestore.instance.collection('wishlists').doc(uid);
//     await wishlistRef.update({'products': FieldValue.arrayUnion([productId])});
//   }

//   Future<void> removeProduct(String productId) async {
//     var wishlistRef = FirebaseFirestore.instance.collection('wishlists').doc(uid);
//     await wishlistRef.update({'products': FieldValue.arrayRemove([productId])});
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'products': products,
//     };
//   }
// }