import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchCtrl extends ChangeNotifier {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> searchList = [];
  List searchListDisplay = [];

  void search(String value) {
    searchListDisplay = [];
    if (value.isNotEmpty) {
      for (int i = 0; i < searchList.length; i++) {
        if (searchList[i]['name'].toLowerCase().contains(value.toLowerCase())) {
          searchListDisplay.add(searchList[i]);
        }
      }
    }

    notifyListeners();
  }

  void searchIntialize() async {
    searchList = [];
    searchList = await FetchDataFirebase.fetchAllProduct();
  }
}
