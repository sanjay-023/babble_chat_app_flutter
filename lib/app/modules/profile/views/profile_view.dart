import 'package:babbleapp/app/modules/profile/views/widget/birthday_widget.dart';
import 'package:babbleapp/app/modules/profile/views/widget/email_box.dart';
import 'package:babbleapp/app/modules/profile/views/widget/phone_box.dart';
import 'package:babbleapp/app/modules/profile/views/widget/signout_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("My Account"),
      ),
      backgroundColor: Color.fromARGB(255, 19, 18, 18),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 44,
                        ),
                        InkWell(
                          onTap: () {
                            profileController.addPhoto();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50, left: 60),
                            child: CircleAvatar(
                              child: Icon(Icons.add_a_photo),
                              backgroundColor: Color.fromARGB(255, 12, 120, 16),
                              radius: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      height: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sanjay Damodharan",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "@sanjay023",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                EmailBoxWidget(),
                SizedBox(
                  height: 15,
                ),
                PhoneBoxwidget(),
                SizedBox(
                  height: 15,
                ),
                BirthdayWidget(),
                SizedBox(
                  height: 30,
                ),
                SignoutButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
