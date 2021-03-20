import 'dart:ui';

import 'package:car_pooling_app/app_colors/app_colors.dart';
import 'package:car_pooling_app/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  SignUpController signUpCtrl = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: kSplash,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 40.0, bottom: 30),
                    child: Column(
                      children: [
                        Text(
                          "Sign Up to",
                          style: kStyle.copyWith(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "PoolRide",
                          style: kStyle.copyWith(
                              fontSize: 25,
                              color: kText,
                              fontWeight: FontWeight.w400),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 15, right: 15, bottom: 25, top: 20),
                    padding: EdgeInsets.only(
                        left: 10, right: 10, bottom: 20, top: 20),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 5, right: 5),
                      child: Form(
                        key: signUpCtrl.signUpKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                              ),
                              child: TextFormField(
                                style: kStyle.copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                controller: signUpCtrl.name,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please enter a value";
                                  } else
                                    return null;
                                },
                                keyboardType: TextInputType.name,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  hintText: " Enter Your Name",
                                  hintStyle: kStyle.copyWith(
                                    fontSize: 18,
                                    color: kSplash.withOpacity(0.4),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextFormField(
                              style: kStyle.copyWith(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              controller: signUpCtrl.age,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter a value";
                                } else
                                  return null;
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: "Enter Your Age",
                                hintStyle: kStyle.copyWith(
                                  fontSize: 18,
                                  color: kSplash.withOpacity(0.4),
                                  fontWeight: FontWeight.w600,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Choose Gender",
                              style: kStyle.copyWith(
                                color: kSplash.withOpacity(0.4),
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: button(
                                    buttonText: "Male",
                                    context: context,
                                    bTextStyle: kStyle.copyWith(
                                      fontSize: 12,
                                      color: signUpCtrl.gend.value == 0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    buttonColor: MaterialStateProperty.all(
                                        signUpCtrl.gend.value == 0
                                            ? kText
                                            : Colors.white),
                                    onPressed: () {
                                      signUpCtrl.gend(0);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                  child: button(
                                    buttonText: "Female",
                                    context: context,
                                    bTextStyle: kStyle.copyWith(
                                      fontSize: 12,
                                      color: signUpCtrl.gend.value == 1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    buttonColor: MaterialStateProperty.all(
                                        signUpCtrl.gend.value == 1
                                            ? kText
                                            : Colors.white),
                                    onPressed: () {
                                      signUpCtrl.gend(1);
                                    },
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              style: kStyle.copyWith(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              controller: signUpCtrl.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter a value";
                                } else if (value.length != 10) {
                                  return "Please enter a valid number";
                                } else
                                  return null;
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: " Enter Your Mobile No.",
                                hintStyle: kStyle.copyWith(
                                  fontSize: 18,
                                  color: kSplash.withOpacity(0.4),
                                  fontWeight: FontWeight.w600,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              style: kStyle.copyWith(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              controller: signUpCtrl.email,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter a value";
                                } else if (!GetUtils.isEmail(value)) {
                                  return "Please enter a valid email";
                                } else
                                  return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: " Enter Your Email Address",
                                hintStyle: kStyle.copyWith(
                                  fontSize: 18,
                                  color: kSplash.withOpacity(0.4),
                                  fontWeight: FontWeight.w600,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              style: kStyle.copyWith(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              controller: signUpCtrl.emgnum,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter a value";
                                } else if (value.length != 10) {
                                  return "Please enter a valid number";
                                } else
                                  return null;
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: "Enter Concerned Person Mobile no.",
                                hintStyle: kStyle.copyWith(
                                  fontSize: 18,
                                  color: kSplash.withOpacity(0.4),
                                  fontWeight: FontWeight.w600,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            button(
                              context: context,
                              bTextStyle: kStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                              buttonText: "Sign Up",
                              onPressed: () {
                                if (signUpCtrl.signUpKey.currentState
                                    .validate()) {
                                  Get.back();
                                  /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));*/
                                }
                              },
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.only(
                                      left: 90,
                                      right: 90,
                                      top: 20,
                                      bottom: 20)),
                              buttonColor: MaterialStateProperty.all(kText),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: kStyle.copyWith(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w200),
                          maxLines: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            "  Sign In",
                            style: kStyle.copyWith(
                                fontSize: 15,
                                color: kText,
                                fontWeight: FontWeight.w200),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
