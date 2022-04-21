import 'package:code_test/res/controller.dart/controller_register.dart';
import 'package:code_test/res/value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerController = Get.find<RegisterController>();
    return GetBuilder<RegisterController>(builder: (controller) {
      return Scaffold(
        backgroundColor: TestColor().secondaryColor,
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: registerController.formRegister,
          child: SingleChildScrollView(
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
                            "Sign Up",
                            style: TextStyle(
                              color: TestColor().primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
                  child: Text("Enter your credentials to continue"),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("User Name"),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: controller.userNameController,
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
                    ),
                  ),
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
                    keyboardType: TextInputType.phone,
                    controller: controller.phoneController,
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

                      return null;
                    },
                    controller: controller.passwordController,
                    obscureText: controller.isHidden.value,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      fillColor: TestColor().secondaryColor,
                      filled: true,
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12),
                      suffix: InkWell(
                        onTap: controller.togglePasswordView,
                        child: Icon(
                          controller.isHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
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
                  child: Text("Confirm Password"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: controller.confirmPasswordController,
                    obscureText: controller.isConfirmHidden.value,
                    validator: (value) {
                      if (!value!.isNotEmpty) {
                        return 'This field is required';
                      }
                      if (value != controller.passwordController.text) {
                        return 'Not Match';
                      }

                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      fillColor: TestColor().secondaryColor,
                      filled: true,
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12),
                      suffix: InkWell(
                        onTap: controller.toggleConfirmPasswordView,
                        child: Icon(
                          controller.isConfirmHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_box,
                          color: TestColor().primaryColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Agree Our Terms of Service & Privacy Policy',
                          style: TextStyle(
                            color: TestColor().primaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (!controller.formRegister.currentState!.validate()) {
                          return;
                        }
                        FocusScope.of(context).unfocus();
                        controller.saveUserInfo();
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Center(
                  child: Text('or sign up with'),
                ),
                const SizedBox(
                  height: 8,
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
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Sign In",
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
        ),
      );
    });
  }
}
