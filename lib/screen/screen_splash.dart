import 'package:code_test/res/controller.dart/controller_login.dart';
import 'package:code_test/res/value.dart';
import 'package:code_test/screen/screen_login.dart';
import 'package:code_test/screen/screen_welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var login = Get.find<LoginController>();
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   backgroundColor: TestColor().secondaryColor,
      // ),
      body: SplashScreenView(
        navigateRoute: login.isLoggedIn.value ? WelcomeScreen() : LoginScreen(),
        duration: 5000,
        imageSize: 550,
        imageSrc: "assets/logo.png",
        text: "",
        textType: TextType.ColorizeAnimationText,
        textStyle: const TextStyle(
          fontSize: 13.0,
        ),
        colors: const [
          Colors.purple,
          Colors.blue,
          Colors.yellow,
          Colors.red,
        ],
        backgroundColor: TestColor().secondaryColor,
      ),
    );
  }
}
