import 'package:babbleapp/app/data/model/user_model.dart';
import 'package:babbleapp/app/modules/authentication/views/authentication_view.dart';
import 'package:babbleapp/app/modules/signup/controllers/signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

final signupController = Get.put(SignupController());

class AuthService extends GetxController {
  bool? signedUp;
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserModel userModel(User? user) {
    return UserModel(uid: user!.uid);
  }

  Future logInWithEmail(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user!;

      userModel(firebaseUser);

      Get.off(AuthenticationView());
    } catch (e) {
      signupController.showErrorSnack(e.toString());
    }
  }

  Stream<UserModel> get userData {
    return auth.authStateChanges().map(userModel);
  }

  Future signUpwithemail(String email, String password) async {
    try {
      UserCredential result = await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .catchError((e) {
        signupController.showErrorSnack(e.message);
      });

      User firebaseUser = result.user!;
      print(firebaseUser.email);

      userModel(firebaseUser);
      Get.offAll(AuthenticationView());
    } catch (e) {
      //signupController.showErrorSnack(e.toString());
      return;
    }
  }

  Future resetPassword(String email) async {
    try {
      return await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    await auth.signOut();
    Get.offAll(AuthenticationView());
  }
}
