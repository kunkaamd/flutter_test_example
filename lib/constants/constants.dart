import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_round_1/resources/app_color.dart';

class Constant {
  static const baseUrl = 'https://apidev.talkhealth.co';
  static const baseApiUrl = '$baseUrl/api/v5';
}

enum PasswordStrong { week, fair, good, tooShort, strong }

extension ToString on PasswordStrong? {
  String toText() {
    if(this == PasswordStrong.week) return "Week";
    if(this == PasswordStrong.fair) return "Fair";
    if(this == PasswordStrong.good) return "Good";
    if(this == PasswordStrong.strong) return "Strong";
    if(this == PasswordStrong.tooShort) return "Too Short";
    return "";
  }

  Color color() {
    if(this == PasswordStrong.week) return AppColor.hE05151;
    if(this == PasswordStrong.fair) return AppColor.hE3A063;
    if(this == PasswordStrong.good) return AppColor.h647FFF;
    if(this == PasswordStrong.strong) return AppColor.h91E2B7;
    if(this == PasswordStrong.tooShort) return Colors.white.withOpacity(0.42);
    return AppColor.h647FFF;
  }
}

extension StringExt on String {
  PasswordStrong strongPassword() {
    if(length <= 8) {
      return PasswordStrong.tooShort;
    }
    else if(RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+").hasMatch(this)) {
      if(RegExp(r"\d").hasMatch(this)) {
        if(RegExp(r"[!@#$%^&*]").hasMatch(this)) {
          return PasswordStrong.strong;
        }
        return PasswordStrong.good;
      }
      return PasswordStrong.fair;
    } else {
      return PasswordStrong.week;
    }
  }
}

extension DioErrorExt on DioError {
  String getErrorMessage() {
    return response?.data['errorMessage'] ?? message;
  }
}
