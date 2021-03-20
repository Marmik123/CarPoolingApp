import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController emgnum = TextEditingController();
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  String verificationId;
  RxString countryCode = "".obs;
  String phoneCode;
  RxBool isLoading = false.obs;
  RxBool hidePassword = true.obs;
  RxInt gend = 0.obs;
}
