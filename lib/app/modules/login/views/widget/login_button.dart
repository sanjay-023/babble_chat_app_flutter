import 'package:babbleapp/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Get.to(HomeView());
        },
        child: Text("Log in"),
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 10, 124, 35),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            minimumSize: const Size(150, 40)));
  }
}
