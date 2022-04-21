import 'package:code_test/res/controller.dart/controller_login.dart';
import 'package:code_test/res/controller.dart/controller_register.dart';
import 'package:code_test/res/value.dart';
import 'package:code_test/screen/screen_login.dart';
import 'package:code_test/screen/screen_register.dart';
import 'package:code_test/screen/screen_splash.dart';
import 'package:code_test/screen/screen_welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: TestColor().secondaryColor,
        systemNavigationBarColor: TestColor().secondaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    Get.put(LoginController());
    Get.put(RegisterController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Nav.splash,
      getPages: [
        GetPage(
          name: Nav.splash,
          page: () => const LaunchScreen(),
        ),
        GetPage(
          name: Nav.welcome,
          page: () => const WelcomeScreen(),
        ),
        GetPage(
          name: Nav.login,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: Nav.register,
          page: () => const RegisterScreen(),
        ),
      ],
    );
  }
}
