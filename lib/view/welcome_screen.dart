import 'package:car_pooling_app/app_colors/app_colors.dart';
import 'package:car_pooling_app/view/login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kMedia = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kSplash,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 80, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "WELCOME!",
                    style: kStyle.copyWith(
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, sed do \neiusmod tempor incididunt ut labore . \nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    style: kStyle.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  button(
                      buttonText: "Get Started",
                      buttonColor: MaterialStateProperty.all(kText),
                      onPressed: () {
                        Get.to(SignIn());
                      },
                      context: context,
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          left: 40, right: 40, top: 12, bottom: 12)),
                      bTextStyle: kStyle.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800))
                ],
              ),
            ),
            Positioned(
                right: 0,
                top: 400,
                bottom: 0,
                child: Image.asset(
                  "assets/images/splash.png",
                  height: kMedia.height / 2,
                  width: kMedia.width,
                ))
          ],
        ));
    ;
  }
}
