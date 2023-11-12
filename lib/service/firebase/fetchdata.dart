import 'package:audiohub/models/user_model.dart';
import 'package:audiohub/views/common_widgets/alert_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FetchDataFirebase {
   String uid = FirebaseAuth.instance.currentUser!.uid;
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
      _firestore.collection('cart').doc(FetchDataFirebase().uid).collection('cartItems');

  static CollectionReference<Map<String, dynamic>> bannerImages = _firestore.collection('banners');

  static Future<Map<String, dynamic>?> fetchProductWithId({required String productId}) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection(_collecionName).doc(productId).get();

    return snapshot.data();
  }

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> fetchAllProduct() async {
    try {
      return await _firestore.collection(_collecionName).get().then((value) => value.docs);
    } on Exception catch (e) {
      toastMessage(message: e.toString());
    }
    return [];
  }

  static CollectionReference<Map<String, dynamic>> allAddress =
      _firestore.collection('addresses').doc(FetchDataFirebase().uid).collection('addressList');

  static Future<List> fetchAllOrders() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> allOrder =
          await _firestore.collection('orders').doc(FetchDataFirebase().uid).get();

      // final allOrder = await userOrderDocRef.get();
      if (allOrder.exists) {
        return allOrder['orderLists'];
      }
    } on Exception catch (e) {
      toastMessage(message: e.toString());
    }

    return [];
  }

  static Future<UserModel?> fetchUserDetails() async {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      final DocumentSnapshot<Map<String, dynamic>> _userDocRef =
          await _firestore.collection('users').doc(uid).get();
      if (_userDocRef.data()!.isNotEmpty) {
        Map data = _userDocRef.data()!;
        String name = data['username'];
        String email = data['email'];
        String image = data['userImage'] ?? '';
        final userDetails = UserModel(name: name, email: email, image: image);
        return userDetails;
      }
    } on Exception catch (e) {
      toastMessage(message: e.toString());
    }
    return null;
  }

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> fetchAllBrands() async {
    try {
      return await _firestore.collection('brands').get().then((value) => value.docs);
    } on Exception catch (e) {
      toastMessage(message: e.toString());
    }
    return [];
  }
}
