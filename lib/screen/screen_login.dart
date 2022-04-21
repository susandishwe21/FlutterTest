import 'package:code_test/res/controller.dart/controller_login.dart';
import 'package:code_test/res/controller.dart/controller_register.dart';
import 'package:code_test/res/value.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await Get.dialog(
            AlertDialog(
              title: Text(
                'Are you sure?',
                style: Theme.of(context).textTheme.headline5,
              ),
              content: const Text(
                'Do you really want to exit?',
              ),
              actions: [
                TextButton(
                  onPressed: () => Get.back(canPop: true, closeOverlays: false),
                  child: Text(
                    'Stay',
                    style: TextStyle(color: TestColor().primaryColor),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                    SystemNavigator.pop();
                  },
                  //Get.back(canPop: false, closeOverlays: true, result: true),
                  child: Text(
                    'Leave',
                    style: TextStyle(color: TestColor().primaryColor),
                  ),
                ),
              ],
            ),
          ) ??
          false;
    }

    return Scaffold(
      backgroundColor: TestColor().secondaryColor,
      body: WillPopScope(
        onWillPop: () async {
          return showExitPopup();
        },
        child: GetBuilder<LoginController>(builder: (loginController) {
          return SingleChildScrollView(
            child: Form(
              key: loginController.formlogin,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Center(
                      child: Container(
                          width: 200,
                          height: 150,
                          child: Image.asset('assets/logo.png')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 80),
                    child: SizedBox(
                      height: 80,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                              top: 0,
                              left: 70,
                              child: Image.asset("assets/duo.png")),
                          Positioned.fill(
                            top: 55,
                            left: 20,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: TestColor().primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Enter your phone number and password"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Phone Number"),
                  ),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      obscureText: loginController.isCheck.value,
                      keyboardType: TextInputType.phone,
                      controller: loginController.phoneController,
                      validator: (value) {
                        if (!value!.isNotEmpty) {
                          return 'This field is required';
                        }

                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        fillColor: TestColor().secondaryColor,
                        filled: true,
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        suffix: InkWell(
                          onTap: loginController.passwordView,
                          child: Icon(
                            loginController.isCheck.value
                                ? Icons.check
                                : Icons.check,
                            color: TestColor().primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Password"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (!value!.isNotEmpty) {
                          return 'This field is required';
                        }
                        if (value !=
                            Get.find<RegisterController>()
                                .userBox
                                .read(Keys.password)) {
                          return "Invalid Password";
                        }
                        return null;
                      },
                      controller: loginController.passwordController,
                      obscureText: loginController.isHiddenPassword.value,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        fillColor: TestColor().secondaryColor,
                        filled: true,
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        suffix: InkWell(
                          onTap: loginController.passwordView,
                          child: Icon(
                            loginController.isHiddenPassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(
                            color: TestColor().primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GetBuilder<RegisterController>(builder: (registerController) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: TestColor().primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              TestColor().primaryColor,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (!loginController.formlogin.currentState!
                                .validate()) {
                              return;
                            }

                            FocusScope.of(context).unfocus();
                            if (loginController.passwordController.text !=
                                registerController.userBox
                                    .read(Keys.password)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.redAccent,
                                  duration: Duration(seconds: 2),
                                  content:
                                      Text("Invalid phone number and password"),
                                ),
                              );
                            } else {
                              loginController.login();
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text('or login with'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 45,
                            child: Image.asset("assets/google.png"),
                          ),
                          Text("Google")
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 45,
                            child: Image.asset("assets/facebook.png"),
                          ),
                          Text("Facebook")
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 45,
                            child: Image.asset("assets/apple.png"),
                          ),
                          Text("Apple ID")
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Get.find<LoginController>()
                              .passwordController
                              .clear();
                          Get.toNamed(Nav.register);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: TestColor().primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
