import 'package:car_pooling_app/app_colors/app_colors.dart';
import 'package:car_pooling_app/controller/otp_controller.dart';
import 'package:car_pooling_app/controller/sign_in_controller.dart';
import 'package:car_pooling_app/widgets/circular_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatelessWidget {
  OtpController otpCtrl = Get.put(OtpController());
  SignInController phoneCtrl = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: kSplash,
          body: Form(
            key: otpCtrl.formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 80, right: 30),
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: [
                  Text(
                    "Enter Your Code",
                    style: kStyle.copyWith(
                      color: kText,
                      fontSize: 55,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 130,
                  ),
                  PinCodeTextField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter Otp";
                      } else if (value.length < 6) {
                        return "Enter valid Otp";
                      } else
                        return null;
                    },
                    controller: otpCtrl.otpController,
                    autoFocus: true,
                    showCursor: true,
                    backgroundColor: kSplash,
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Color(0xFF0CBCC5),
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: false,
                    obscuringCharacter: '*',
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      borderWidth: 2,
                      disabledColor: Colors.white,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(15),
                      inactiveColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      activeColor: kText,
                      activeFillColor: kText,
                      selectedColor: kText,
                      selectedFillColor: otpCtrl.otpFocus.hasFocus ?? false
                          ? Colors.black
                          : Colors.white,
                    ),
                    cursorColor: Colors.black,
                    boxShadows: [
                      BoxShadow(
                        color: kText.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: Offset(0, 7),
                      )
                    ],
                    animationDuration: Duration(milliseconds: 300),
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    focusNode: otpCtrl.otpFocus,
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onTap: () {
                      print("Pressed");
                    },
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  SizedBox(
                    child: otpCtrl.isLoading.value
                        ? Center(
                            child: buildLoader(),
                          )
                        : button(
                            buttonText: "Continue",
                            bTextStyle: kStyle.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if (otpCtrl.formKey.currentState.validate()) {
                                otpCtrl.verifyPhoneManually();
                              }
                            },
                            buttonColor: MaterialStateProperty.all(kText),
                            context: context,
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20)),
                          ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Terms of Service",
                        style: kStyle.copyWith(
                          color: Colors.white24,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Privacy Policy",
                        style: kStyle.copyWith(
                          color: Colors.white24,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
