import 'package:apii/view/auth/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.white,
              Colors.green.shade100,
              Colors.green.shade100,
            ])),
        child: SingleChildScrollView(
          child: GetBuilder<AuthController>(
              init: AuthController(),
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height * 0.18,
                      ),
                      const Text(
                        "Hello Again!",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      const Text(
                        "Chance to get your life better",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Form(
                        key: controller.loginFormKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controller.email,
                              decoration: const InputDecoration(
                                hintText: "Enter email",
                              ),
                              validator: (val) {
                                return controller.validateEmail(val!);
                              },
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            TextFormField(
                              controller: controller.password,
                              obscureText: controller.hidePassword,
                              decoration: InputDecoration(
                                hintText: "Password",
                                suffixIcon: GestureDetector(
                                  onTap: controller.togglePassword,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 18.0),
                                    child: Image.asset(
                                      'assets/hideIcon.png',
                                      width: Get.width * 0.01,
                                      height: Get.height * 0.01,
                                    ),
                                  ),
                                ),
                              ),
                              validator: (val) {
                                return controller.validatePassword(val!);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      SizedBox(
                          width: Get.width,
                          child: const Text(
                            "Recovery Password",
                            textAlign: TextAlign.end,
                          )),
                      SizedBox(
                        height: Get.height * 0.06,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller.login(controller.email.text,
                                controller.password.text);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              )),
                          child: const Text(
                            "login",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      const Text("or continue with"),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: context.width * 0.15,
                                width: context.width * 0.15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.white)),
                                child: Image.asset("assets/google.png")),
                            Container(
                                height: context.width * 0.15,
                                width: context.width * 0.15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.white)),
                                child: Image.asset("assets/apple.png")),
                            Container(
                                height: context.width * 0.15,
                                width: context.width * 0.15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.white)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/fb.png"),
                                )),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Not a member? ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: ' Register now',
                              style: const TextStyle(color: Colors.green),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
