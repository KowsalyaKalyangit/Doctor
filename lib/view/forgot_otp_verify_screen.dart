import 'package:doctor/controller/forgot_otp_controller.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controller/forgotpassword_controller.dart';
import '../utils/colors.dart';
import 'change_password.dart';

class ForgotOtpField extends StatefulWidget {
  const ForgotOtpField({Key? key}) : super(key: key);

  @override
  State<ForgotOtpField> createState() => _ForgotOtpFieldState();
}

class _ForgotOtpFieldState extends State<ForgotOtpField> {
  ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  // OtpVerifyController otpVerifyController = Get.put(OtpVerifyController());
  // ForgotOtpController forgotOtpController = Get.put(ForgotOtpController());
  ForgotOtpController forgotOtpController = Get.put(ForgotOtpController());
  bool hasError = false;
  String currentText = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
              height: 10.0.hp,
            ),
            SizedBox(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
                  child: PinCodeTextField(
                    appContext: context,
                    textStyle: GoogleFonts.jost(
                        textStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    pastedTextStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    //obscureText: true,
                    // obscuringCharacter: '*',
                    // obscuringWidget: FlutterLogo(
                    //   size: 24,
                    // ),
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,

                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: MediaQuery.of(context).size.width * 0.15,
                      activeColor: appcolor,
                      selectedFillColor: appcolor,
                      selectedColor: Colors.white,
                      inactiveColor: const Color(0xffD9D9D9),
                      inactiveFillColor: Colors.white,
                      activeFillColor: hasError ? Colors.grey[100] : appcolor,
                    ),
                    cursorColor: Colors.white,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,

                    onChanged: (value) {
                      // ignore: avoid_print
                      print(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    // onCompleted: (value) {
                    //   print('success');
                    // },
                    onCompleted: (value) {
                      print('clickkk');
                      forgotOtpController.forgotOtp(value);
                    },
                  )),
            ),
            SizedBox(height: 2.00.hp),
            ElevatedButton(
              onPressed: () async {
                if (forgotOtpController.forgotOtp.value.isEmpty) {
                  // Fluttertoast.showToast(msg: 'Please enter otp');
                } else if (formKey.currentState!.validate()) {
                  await forgotOtpController.forgotOtpController(
                      email: forgotPasswordController.email.text.toString());
                }

                 Get.to(  ChangeNewPassword(email:forgotPasswordController.email.text.toString()));
              },
              child: Text('Verify otp'),
            ),
            SizedBox(height: 4.00.hp),
          ],
        ),
      ),
    );
  }
}
