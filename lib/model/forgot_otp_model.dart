// To parse this JSON data, do
//
//     final forgetOtpModel = forgetOtpModelFromJson(jsonString);

import 'dart:convert';

ForgetOtpModel forgetOtpModelFromJson(String str) => ForgetOtpModel.fromJson(json.decode(str));

String forgetOtpModelToJson(ForgetOtpModel data) => json.encode(data.toJson());

class ForgetOtpModel {
    String message;

    ForgetOtpModel({
        required this.message,
    });

    factory ForgetOtpModel.fromJson(Map<String, dynamic> json) => ForgetOtpModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
