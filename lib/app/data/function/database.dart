import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseMethod extends GetxController {
  createChatRoom(String chatroomid, chatroomMap) {
    FirebaseFirestore.instance
        .collection("chatroom")
        .doc(chatroomid)
        .set(chatroomMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
