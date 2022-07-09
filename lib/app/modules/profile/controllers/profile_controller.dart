import 'dart:io';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  File? img;
  File? cropedImg;
  // //TODO: Implement ProfileController

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

  void addPhoto() async {
    final pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    img = File(pickImage!.path);
    cropImage(img!.path);

    print(img);
    update();
  }

  void cropImage(String filepath) async {
    CroppedFile? cropImage = await ImageCropper().cropImage(
        sourcePath: filepath,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
    if (cropImage != null) {
      cropedImg = File(cropedImg!.path);
      update();
    }
  }
}
