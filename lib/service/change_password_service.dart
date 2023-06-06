import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/change_passwor_model.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;
class ChangePasswordService {
  Future changePasswordService(
      {email, password, password_confirmation}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString(Constants.token);
      var data = {
        "email": email ?? '',
        "password": password ?? '',
        "password_confirmation": password_confirmation ?? '',
         
      };
      log(data.toString());
      var response = await http.post(Uri.parse('https://jooju.in/app-demo/public/api/change-doctor-password'),
          headers: {'Authorization': 'Bearer $token'}, body: data);
      log('responseeee-------${response.body.toString()}');

      var jsonresponse = jsonDecode(response.body);
      log('jsonrespose----${jsonresponse}');

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          return ChangePasswordModel.fromJson(jsonresponse);
        } else {
          // Fluttertoast.showToast(
          //     msg: jsonresponse['message']['newPassword'].toString());
          Get.back();
        }
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
