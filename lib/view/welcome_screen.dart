import 'package:car_pooling_app/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSplash,
        body: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 80),
          child: Column(
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
                "Fooddoor satisfies your food cravings \nwith your favourite food delivered to \nyou, wherever you are",
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
                  onPressed: () {},
                  context: context,
                  padding: MaterialStateProperty.all(EdgeInsets.only(
                      left: 40, right: 40, top: 12, bottom: 12)),
                  bTextStyle: kStyle.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800))
            ],
          ),
        ));
    ;
  }
}
