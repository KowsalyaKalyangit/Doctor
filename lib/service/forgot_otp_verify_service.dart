import 'dart:convert';
import 'dart:developer';
import 'package:doctor/model/forgot_password_model.dart';
import 'package:http/http.dart' as http;

 

class ForgotOtpService {
  //otp
  Future forgototpService({email, otp}) async {
    try {
      var data = {"email": email ?? '', "otp": otp ?? ''};
      log(data.toString());

      var response = await http.post(Uri.parse('https://jooju.in/app-demo/public/api/verify-doctor-otp'), body: data);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          return ForgetOtpModel.fromJson(jsonresponse);
        } else {
         // Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        }
      } else {
       // Fluttertoast.showToast(msg: jsonresponse['message'].toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
