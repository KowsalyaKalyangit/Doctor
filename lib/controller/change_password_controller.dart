import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/change_password_service.dart';
import '../utils/constants.dart';
import 'login_controller.dart';

class ChangePaswordController extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();
  RxBool createpasswordLoad = true.obs;
  var changePassword = ChangePasswordService();
  Future changePasswordController({context,email}) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    var email = _sharedPreferences.getString(Constants.email);
    if (password.text.isEmpty) {
      //Fluttertoast.showToast(msg: "Please enter old password");
    } else if (password_confirmation.text.isEmpty) {
      //Fluttertoast.showToast(msg: "Please enter create password");
    } else {
      createpasswordLoad(true);
      if (createpasswordLoad.value) {
        _loadingBar(context);
      }

      try {
        var response = await changePassword.changePasswordService(
            password: password.text,
            password_confirmation: password_confirmation.text,
            email: email);
        log('responseeeee------------');
        log(response.toString());

        if (response != null) {
          Get.back();
          print('responseeee');
          createpasswordLoad(false);
          // Fluttertoast.showToast(msg: response.message.toString());
          Get.back();
        } else {
          //Fluttertoast.showToast(msg: response.message.toString());
          createpasswordLoad(false);
        }
      } catch (e) {
        rethrow;
      }
    }
  }
}

void _loadingBar(BuildContext ctx) {
  showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        return const Center(
          child: Loader(),
        );
      });
}
