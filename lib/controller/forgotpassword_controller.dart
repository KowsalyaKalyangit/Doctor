import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/forgot_passwor_service.dart';
import '../view/forgot_otp_verify_screen.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController email = TextEditingController();
  var forgotpasswordService = ForgotPasswordService();

  Future forgotPasswordController() async {
    try {
      var response =
          await forgotpasswordService.forgotPasswordService(email: email.text);
      log('mobile---${response}');
      if (response != null) {
        //Fluttertoast.showToast(msg: response.message.toString());
        Get.to(ForgotOtpField());
        // Get.toNamed('/forgototp');
      } else {
        //Fluttertoast.showToast(msg: response.message.toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
