import 'package:car_pooling_app/app_colors/app_colors.dart';
import 'package:car_pooling_app/view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kMedia = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSplash,
      body: Container(
        width: kMedia.width,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            Get.to(Welcome());
          },
          child: Text(
            "POOLRIDE",
            style: kStyle,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
