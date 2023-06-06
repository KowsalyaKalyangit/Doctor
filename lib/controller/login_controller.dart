import 'package:doctor/model/login_model.dart';
import 'package:doctor/view/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/login_service.dart';
import '../utils/constants.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List<LoginModel> _loginmodel = [];
  List<LoginModel> get getloginmodel => _loginmodel;
  RxBool isloginLoad = true.obs;
  //otp

  var loginService = LoginService();
  Future loginController({context}) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    if (email.text.isEmpty) {
      // Fluttertoast.showToast(msg: 'Please enter email');
    } else if (password.text.isEmpty) {
      //  Fluttertoast.showToast(msg: 'Please enter password');
    } else {
      isloginLoad(true);
      if (isloginLoad.value) {
        _loadingBar(context);
      }

      try {
        var response = await loginService.loginService(
            email: email.text, password: password.text);
        print(response);

        if (response != null) {
          print(response);
          _sharedPreferences.setString(Constants.token, response.token);
                 _sharedPreferences.setString(Constants.email, response.user.email);
          Get.to(HomeScreen());        

          // Get.toNamed('/home');
          isloginLoad(false);
          // Get.back();
        } else {
          isloginLoad(false);

          Get.back();
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  // logout
  Future logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      sharedPreferences.clear().then((value) {
        email.clear();
        password.clear();
        // Get.back();
      });
    } catch (e) {
      rethrow;
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

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          // decoration: BoxDecoration(color: Colors.amber),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Center(child: const CircularProgressIndicator())),
    );
  }
}
