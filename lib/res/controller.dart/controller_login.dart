import 'package:code_test/res/value.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formlogin = GlobalKey<FormState>();
  RxBool isLoggedIn = false.obs;
  RxBool isHiddenPassword = true.obs;
  RxBool isCheck = true.obs;
  var box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    box.writeIfNull(Keys.isLoggedIn, false);
    isLoggedIn.value = box.read(Keys.isLoggedIn);
  }

  void passwordView() {
    isHiddenPassword.value = !isHiddenPassword.value;
    update();
  }

  void checkView() {
    isCheck.value = !isCheck.value;
    update();
  }

  login() {
    isLoggedIn.value = true;
    update();
    box.write(Keys.isLoggedIn, true);
    Get.toNamed(Nav.welcome);
    update();
  }
}
