import 'package:babbleapp/app/data/function/constants.dart';
import 'package:babbleapp/app/data/function/database.dart';
import 'package:babbleapp/app/modules/search/controllers/search_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

final gdatabaseController = Get.put(DatabaseMethod());
final gsearchController = Get.put(SearchController());

class ChatController extends GetxController {
  final chatTextController = TextEditingController();
  Stream? meassageStream;

  @override
  void onInit() {
    super.onInit();
    getMessageStream();
  }

  void sendMessage() {
    if (chatTextController.text.isNotEmpty) {
      Map<String, String> messageMap = {
        "message": chatTextController.text,
        "sendby": Constants.myName
      };
      gdatabaseController.addConversationMessages(
          gsearchController.chatroomId!, messageMap);
    }
  }

  getMessageStream() {
    meassageStream = gdatabaseController
        .getConversationMessages(gsearchController.chatroomId!);
    update();
  }
}
