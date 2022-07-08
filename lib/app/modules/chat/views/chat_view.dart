import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 19, 18, 18),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 9, 121, 13),
            title: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Sanjay",
                )
              ],
            )),
        body: Column());
  }
}
