import 'package:audiohub/models/address_model.dart';
import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:audiohub/service/firebase/wishlist_services.dart';
import 'package:audiohub/views/common_widgets/alert_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddressServices {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static Future addAddress(
    BuildContext context,
    AddressModel addressModel,
  ) async {
    try {
      await _firestore
          .collection('addresses')
          .doc(FetchDataFirebase().uid)
          .collection('addressList')
          .add(addressModel.tomap())
          .then(
            (value) => snackbarMessage(message: 'Address added successfully', context: context),
          );
    } on FirebaseException catch (e) {
      alertshower(message: e.message!, context: context);
    }
  }

  static Future<bool> deleteAddress(
    BuildContext context,
    String addressId,
  ) async {
    try {
      return await _firestore
          .collection('addresses')
          .doc(FetchDataFirebase().uid)
          .collection('addressList')
          .doc(addressId)
          .delete()
          .then((value) => true);
    } on FirebaseException catch (e) {
      alertshower(message: e.message!, context: context);
      return false;
    }
  }
}
