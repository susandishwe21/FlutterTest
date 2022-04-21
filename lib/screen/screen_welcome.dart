import 'package:code_test/res/value.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/salve.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: SizedBox(
                height: 80,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(top: 5, child: Image.asset("assets/teri.png")),
                    Positioned.fill(
                      top: 50,
                      left: 50,
                      child: Row(
                        children: [
                          const Text(
                            "Welcome to ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Fruity",
                            style: TextStyle(
                              color: TestColor().primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Buy groceries with us',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Spacer(),
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
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.redAccent,
                        duration: Duration(seconds: 2),
                        content: Text("Thanks for choosing us ..."),
                      ),
                    );
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
