import 'package:audiohub/service/firebase/wishlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FetchDataFirebase {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static String collecionName = 'products';

  static CollectionReference allProducts = firestore.collection(collecionName);

  static Query<Map<String, dynamic>> neckband =
      firestore.collection(collecionName).where('category', isEqualTo: 'Neckband');

  static Query<Map<String, dynamic>> headphone =
      firestore.collection(collecionName).where('category', isEqualTo: 'Headphone');

  static Query<Map<String, dynamic>> tws =
      firestore.collection(collecionName).where('category', isEqualTo: 'TWS');

  static CollectionReference<Map<String, dynamic>> cart =
      firestore.collection('cart').doc(WishListFirebase.uid).collection('cartItems');

  static Future<Map<String, dynamic>?> fetchProductWithId({required String productId}) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection(collecionName).doc(productId).get();

    return snapshot.data();
  }
}
