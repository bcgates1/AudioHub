import 'package:cloud_firestore/cloud_firestore.dart';

class FetchDataFirebase {
  static String collecionName = 'products';
  static CollectionReference allProducts = FirebaseFirestore.instance.collection(collecionName);

  static Query<Map<String, dynamic>> neckband =
      FirebaseFirestore.instance.collection(collecionName).where('category', isEqualTo: 'Neckband');

  static Query<Map<String, dynamic>> headphone = FirebaseFirestore.instance
      .collection(collecionName)
      .where('category', isEqualTo: 'Headphone');

  static Query<Map<String, dynamic>> tws =
      FirebaseFirestore.instance.collection(collecionName).where('category', isEqualTo: 'TWS');

  static Future<Map<String, dynamic>?> fetchProductWithId({required String productId}) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection(collecionName).doc(productId).get();

    return snapshot.data();
  }
}
