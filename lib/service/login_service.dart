import 'dart:convert';
import 'dart:developer';

 
import 'package:doctor/model/login_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
 
class LoginService {
  Future<LoginModel?> loginService({email, password,type}) async {
    var data = {'email': email ?? '', 'password': password ?? '',"type":type??'0'};
   // var encodedata = jsonEncode(data);
    print(data.toString());
    try {
      var response = await http.post(
          Uri.parse('https://jooju.in/app-demo/public/api/login-doctor'),
          body: data);
      print(response.toString());

      var jsonresponse = jsonDecode(response.body);
      print(jsonresponse.toString());
      if (response.statusCode == 200) {
        print('kowsiiiiii');

        log('successs-------------------------------');
        log('${jsonresponse['token']}');
        // Fluttertoast.showToast(msg: jsonresponse['message'].toString());

        return LoginModel.fromJson(jsonDecode(response.body));
      } else {
        // Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
