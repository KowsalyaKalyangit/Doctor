import 'dart:developer';

import 'package:doctor/service/forgot_otp_verify_service.dart';
import 'package:get/get.dart';

class ForgotOtpController extends GetxController {
  var forgotOtp = ''.obs;
  var forgotservice = ForgotOtpService();
  RxBool isotpLoad = true.obs;
  Future forgotOtpController({email}) async {
    try {
      var response = await forgotservice.forgototpService(
          otp: forgotOtp.value.toString(), email: email);
      print('ccc');
      log(response.toString());

      if (response != null) {
        isotpLoad(false);

        Get.toNamed('/changeNewPassword');
      } else {
        isotpLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
