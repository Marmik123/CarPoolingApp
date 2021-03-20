import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  TextEditingController mobileNo = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String verificationId;
  RxString countryCode = "".obs;
  String phoneCode;
  RxBool isLoading = false.obs;
  RxBool hidePassword = true.obs;
}
