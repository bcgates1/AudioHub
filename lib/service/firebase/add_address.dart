import 'package:audiohub/models/address_model.dart';
import 'package:audiohub/service/firebase/wishlist.dart';
import 'package:audiohub/views/common_widgets/alert_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddAddress {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future addAddress(
    BuildContext context,
    AddressModel addressModel,
  ) async {
    try {
      await firestore
          .collection('addresses')
          .doc(WishListFirebase.uid)
          .collection('addressList')
          .add(addressModel.tomap());
    } on FirebaseException catch (e) {
      alertshower(message: e.message!, context: context);
    }
  }
}
