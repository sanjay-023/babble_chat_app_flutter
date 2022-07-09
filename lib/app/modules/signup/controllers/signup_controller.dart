import 'package:babbleapp/app/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // //TODO: Implement SignupController

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

  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final authServiceController = Get.put(AuthService());
  bool isLoading = false;

  signMeup() {
    if (emailController.text.isNotEmpty ||
        signupPasswordController.text.isNotEmpty ||
        fNameController.text.isNotEmpty ||
        lNameController.text.isNotEmpty) {
      if (emailValidateFun() == true) {
        if (signupPasswordController.text.length >= 6) {
          if (signupPasswordController.text == confirmPasswordController.text) {
            authServiceController.signUpwithemail(
                emailController.text, signupPasswordController.text);
          } else {
            showErrorSnack("Password does not match");
          }
        } else {
          showErrorSnack("Password should contain atleast 6 charecters");
        }
      } else {
        showErrorSnack("Enter a valid email");
      }
    } else {
      showErrorSnack("Required fields empty");
    }
  }

  showErrorSnack(String message) {
    Get.snackbar("", "",
        titleText: Text(
          "Signup Failed",
          style: TextStyle(color: Color.fromARGB(255, 245, 17, 1)),
        ),
        messageText: Text(
          message,
          style: TextStyle(color: Colors.white),
        ));
  }

  emailValidateFun() {
    final emailValide = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (emailValide.hasMatch(emailController.text)) {
      return true;
    }
  }

  changeLoadingStatus() {
    isLoading = true;
    update();
  }

  changeLoadingStatusToFalse() {
    isLoading = false;
    update();
  }
}
