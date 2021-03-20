import 'package:car_pooling_app/app_colors/app_colors.dart';
import 'package:car_pooling_app/controller/user_type_controller.dart';
import 'package:car_pooling_app/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserType extends StatelessWidget {
  UserTypeCtrl userTypeCtrl = Get.put(UserTypeCtrl());
  String userChoice;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Which Type of User you are?",
                        style: kStyle.copyWith(
                          color: kSplash,
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        button(
                          buttonText: "With Vehicle",
                          bTextStyle: kStyle.copyWith(
                            fontSize: 16,
                            color: userTypeCtrl.gend.value == 0
                                ? Colors.white
                                : Colors.black,
                          ),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 80)),
                          buttonColor: MaterialStateProperty.all(
                              userTypeCtrl.gend.value == 0
                                  ? kText
                                  : Colors.white),
                          onPressed: () {
                            userTypeCtrl.gend.value = 0;
                            userChoice = "With Vehicle";
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        button(
                          buttonText: "Without Vehicle",
                          bTextStyle: kStyle.copyWith(
                            fontSize: 16,
                            color: userTypeCtrl.gend.value == 1
                                ? Colors.white
                                : Colors.black,
                          ),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 70)),
                          buttonColor: MaterialStateProperty.all(
                              userTypeCtrl.gend.value == 1
                                  ? kText
                                  : Colors.white),
                          onPressed: () {
                            userTypeCtrl.gend.value = 1;
                            userChoice = "Without Vehicle";
                          },
                        ),
                        SizedBox(
                          height: 90,
                        ),
                      ],
                    ),
                    button(
                      buttonText: "Done",
                      bTextStyle: kStyle.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 20, horizontal: 60)),
                      buttonColor: MaterialStateProperty.all(kText),
                      onPressed: () {
                        Get.to(HomeScreen(),
                            curve: Curves.elasticInOut,
                            duration: Duration(seconds: 1));
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
