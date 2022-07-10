import 'package:babbleapp/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

final profileController = Get.put(ProfileController());

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    profileController.getData();
    super.onInit();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
