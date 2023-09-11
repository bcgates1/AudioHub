import 'package:audiohub/service/firebase/wishlist_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FetchDataFirebase {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String _collecionName = 'products';

  static CollectionReference allProducts = _firestore.collection(_collecionName);

  static Query<Map<String, dynamic>> neckband =
      _firestore.collection(_collecionName).where('category', isEqualTo: 'Neckband');

  static Query<Map<String, dynamic>> headphone =
      _firestore.collection(_collecionName).where('category', isEqualTo: 'Headphone');

  static Query<Map<String, dynamic>> tws =
      _firestore.collection(_collecionName).where('category', isEqualTo: 'TWS');

  static CollectionReference<Map<String, dynamic>> cart =
      _firestore.collection('cart').doc(WishListFirebase.uid).collection('cartItems');

  static CollectionReference<Map<String, dynamic>> bannerImages = _firestore.collection('banners');

  static Future<Map<String, dynamic>?> fetchProductWithId({required String productId}) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection(_collecionName).doc(productId).get();

    return snapshot.data();
  }

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> fetchAllProduct() async {
    final allProducts = await _firestore.collection(_collecionName).get();

    return allProducts.docs;
  }

  static CollectionReference<Map<String, dynamic>> allAddress =
      _firestore.collection('addresses').doc(WishListFirebase.uid).collection('addressList');

  static Future<List> fetchAllOrders() async {
    DocumentReference userOrderDocRef = _firestore.collection('orders').doc(WishListFirebase.uid);

    final allOrder = await userOrderDocRef.get();
    if (allOrder.exists) {
      return allOrder['orderLists'];
    }
    return [];
  }
}
