import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../controller/login_controller.dart';
import '../utils/colors.dart';
import '../utils/textstyles.dart';
import 'forgot_password.dart';

class LoginInputFields extends StatefulWidget {
  const LoginInputFields({Key? key}) : super(key: key);

  @override
  State<LoginInputFields> createState() => _LoginInputFieldsState();
}

class _LoginInputFieldsState extends State<LoginInputFields> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginController loginController = Get.put(LoginController());
  bool _isPinnewHidden = true;

  void _togglecnewPinView() {
    setState(() {
      _isPinnewHidden = !_isPinnewHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 50.00, width: 300.00,
              // padding: const EdgeInsets.only(
              //   left: 20,
              //   right: 20,
              // ),
              child: TextFormField(
                controller: loginController.email,
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
                    fillColor: const Color(0xffC6C6C6),
                    hintText: 'email',
                    contentPadding: const EdgeInsets.only(left: 10),
                    border: const OutlineInputBorder(
                      gapPadding: 4,
                    )),
              ),
            ),
            SizedBox(height: 3.00),
            Container(
              color: Colors.white,
              height: 50.00, width: 300.00,
              // padding: const EdgeInsets.only(
              //   left: 20,
              //   right: 20,
              // ),
              child: TextFormField(
                controller: loginController.password,
                obscureText: _isPinnewHidden,
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
                      onTap: () {
                        _togglecnewPinView();
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 5, bottom: 15),
                        child: Icon(
                          _isPinnewHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: MediaQuery.of(context).size.height * 0.025,
                          color: const Color(0xffC6C6C6),
                        ),
                      ),
                    ),
                    fillColor: const Color(0xffC6C6C6),
                    hintText: 'Password',
                    contentPadding: const EdgeInsets.only(left: 10),
                    border: const OutlineInputBorder(
                      gapPadding: 4,
                    )),
              ),
            ),
            SizedBox(height: 5.00),
            InkWell(
              onTap: () {
                 Get.to(const ForgotPasswordInputField());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 9.00,
                              color: appbarcolor,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.00),
            ElevatedButton(
              onPressed: () async {
                print('clickk');
                if (formKey.currentState!.validate()) {
                  print('click');

                  await loginController.loginController(context: context);
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
