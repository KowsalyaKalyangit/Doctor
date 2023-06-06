import 'package:doctor/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/forgotpassword_controller.dart';
import '../controller/login_controller.dart';
import '../utils/colors.dart';
import 'forgot_otp_verify_screen.dart';

class ForgotPasswordInputField extends StatefulWidget {
  const ForgotPasswordInputField({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordInputField> createState() =>
      _ForgotPasswordInputFieldState();
}

class _ForgotPasswordInputFieldState extends State<ForgotPasswordInputField> {
  ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  LoginController loginController = Get.put(LoginController());
  TextEditingController mobileNumber = TextEditingController();

  get forminputstyle => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 3.00.hp),
          Container(
            color: Colors.white,
            height: 9.00.hp, width: 90.00.wp,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              style: forminputstyle,
              controller: forgotPasswordController.email,

              //obscureText: _isPinnewHidden1,

              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: appcolor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                        color: const Color(0xffC6C6C6).withOpacity(0.5),
                        width: 1),
                  ),
                  suffixIcon: InkWell(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 5, bottom: 15),
                      child: Icon(
                        Icons.phone,
                        size: MediaQuery.of(context).size.height * 0.025,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  fillColor: const Color(0xffC6C6C6),
                  hintText: 'Mobile Number',
                  contentPadding: const EdgeInsets.only(left: 10),
                  //hintStyle: formhintstyle,
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
          SizedBox(height: 3.00.hp),
          ElevatedButton(
            onPressed: () async {
              if (forgotPasswordController.email.text.isEmpty) {
                //Fluttertoast.showToast(msg: 'Please enter mobile number');
              } else {
                await forgotPasswordController
                    .forgotPasswordController()
                    .then((value) => Get.to(ForgotOtpField()));
              }
            },
            child: Text('verify'),
          ),
        ],
      ),
    );
  }
}
