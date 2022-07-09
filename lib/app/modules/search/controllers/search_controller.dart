import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  // //TODO: Implement SearchController

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
  // void increment() => count.value++;

  final searchTextController = TextEditingController();
  QuerySnapshot? searchSnapshot;

  Future getUserByFName(String fName) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("firstname", isEqualTo: fName)
        .get()
        .then((value) {
      searchSnapshot = value;
      update();
    });
  }
}
