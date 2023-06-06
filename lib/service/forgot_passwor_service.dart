import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../model/forgot_password_model.dart';

 

class ForgotPasswordService {
  Future forgotPasswordService({email}) async {
    log('enterrrrr');
    try {
      var data = {"email": email};
      log('dataa');
      log('mobieee--${data.toString()}');

      var response =
          await http.post(Uri.parse("https://jooju.in/app-demo/public/api/forget-doctor-password"), body: data);

      var jsonresponse = jsonDecode(response.body);
      log('mobile----${response.body.toString()}');
      log('toast------');

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          // Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          return ForgetOtpModel.fromJson(jsonresponse);
        } else {
          // Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          return null;
        }
      } else {
        // Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
