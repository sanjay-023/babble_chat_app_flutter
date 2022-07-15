import 'package:babbleapp/app/data/function/constants.dart';
import 'package:babbleapp/app/data/function/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final searchTextController = TextEditingController();
  QuerySnapshot? searchSnapshot;
  int? searchIndex;

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

  createChatROmmAndStartConvo(String chatUserName) {
    final databaseController = Get.put(DatabaseMethod());
    String chatroomId = getChatRoomId(chatUserName, Constants.myName);
    final constController = Get.put(Constants());
    constController.getUserInfo();
    List<String?> chatUsers = [chatUserName, Constants.myName];
    Map<String, dynamic> chatRoomMap = {
      "users": chatUsers,
      "charroomid": chatroomId
    };
    databaseController.createChatRoom(chatUserName, chatRoomMap);
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "${b}_ $a";
    } else {
      return "${a}_$b";
    }
  }

  // changeSearchIndex(index) {
  //   searchIndex = index;
  //   update();
  // }
}
