import 'package:babbleapp/app/modules/home/views/widget/list_widget.dart';
import 'package:babbleapp/app/modules/profile/views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 19, 18, 18),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            child: Column(children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Messages",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ProfileView());
                      },
                      child: CircleAvatar(
                        radius: 12,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoTextField(
                decoration: BoxDecoration(
                    color: Color.fromARGB(79, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10)),
                placeholder: "search",
                placeholderStyle: TextStyle(color: Colors.white),
              ),
              Expanded(
                child: ListWidget(),
              )
            ]),
          ),
        ));
  }
}
