import 'dart:developer';

import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchCtrl extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  List<QueryDocumentSnapshot<Map<String, dynamic>>> searchList = [];
  List searchListDisplay = [];
  bool filterVisibility = false;
  List allBrands = [];
  int selectedIndex = 0;

  void search(String value) {
    searchListDisplay = [];
    if (value.isNotEmpty) {
      for (int i = 0; i < searchList.length; i++) {
        if (searchList[i]['name'].toLowerCase().contains(value.toLowerCase())) {
          if (filterVisibility) {
            if (searchList[i]['brand'] == allBrands[selectedIndex]['name']) {
              searchListDisplay.add(searchList[i]);
            }
          } else {
            searchListDisplay.add(searchList[i]);
          }
        }
      }
    }

    notifyListeners();
  }

  void searchIntialize() async {
    searchList = [];
    searchList = await FetchDataFirebase.fetchAllProduct();
    allBrands = await FetchDataFirebase.fetchAllBrands();
  }

  void choiceChipsSelect({required int index}) {
    selectedIndex = index;    
    notifyListeners();
  }

  void changeFilterVisibility() {
    filterVisibility = !filterVisibility;
    notifyListeners();
  }
}
