import 'dart:developer';

import 'package:audiohub/models/address_model.dart';
import 'package:audiohub/service/firebase/address_services.dart';
import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:audiohub/views/common_widgets/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddressSelector extends ChangeNotifier {
  List addressList = [];
  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  addAddress({required BuildContext context, required AddressModel addressModel}) async {
    await AddressServices.addAddress(context, addressModel);
    addressList.add(addressModel.tomap());
    notifyListeners();
  }

  Future<bool> fetchAddress() async {
    QuerySnapshot<Map<String, dynamic>> allAddress = await FetchDataFirebase.allAddress.get();
    addressList = [];
    if (allAddress.docs.isNotEmpty) {
      addressList = allAddress.docs.map((e) {
        Map<String, dynamic> data = e.data();
        data['id'] = e.id; // Adding the document ID to the data
        return data;
      }).toList();
      log(addressList.toString());
      return true;
    }
    return false;
  }

  deleteAddress({required BuildContext context, required int index}) async {
    if (await AddressServices.deleteAddress(context, addressList[index]['id'])) {
      addressList.removeAt(index);
      if (selectedIndex == index && index != 0) selectedIndex--;
      toastMessage(message: 'Address Successfully Deleted');
      await fetchAddress();
      notifyListeners();
    }
  }
}
