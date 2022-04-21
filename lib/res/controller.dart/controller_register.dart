import 'package:code_test/res/controller.dart/controller_login.dart';
import 'package:code_test/res/value.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  final GlobalKey<FormState> formRegister = GlobalKey<FormState>();
  RxBool isHidden = true.obs;
  RxBool isConfirmHidden = true.obs;

  var userBox = GetStorage();
  void togglePasswordView() {
    isHidden.value = !isHidden.value;
    update();
  }

  void toggleConfirmPasswordView() {
    isConfirmHidden.value = !isConfirmHidden.value;
    update();
  }

  void saveUserInfo() {
    userBox.write(Keys.user, userNameController.text);
    userBox.write(Keys.phone, phoneController.text);
    userBox.write(Keys.password, confirmPasswordController.text);
    Get.find<LoginController>().phoneController.text = userBox.read(Keys.phone);
    debugPrint("${userBox.read(Keys.user)}");
    debugPrint("${userBox.read(Keys.phone)}");
    debugPrint("${userBox.read(Keys.password)}");
    Get.offAllNamed(Nav.login);
    update();
  }
}
