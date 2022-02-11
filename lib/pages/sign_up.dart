import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_round_1/components/app_textfield.dart';
import 'package:test_round_1/pages/sign_up_vm.dart';

import '../components/app_password.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 409.h,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/signup_background.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 325.h),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(29, 34, 56, 0.13), Colors.black],
                  stops: [0.09, 0.52],
                ),
              ),
              child: SingleChildScrollView(
                child: GetBuilder<SignUpVM>(
                  init: SignUpVM(),
                  builder: (vm) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Let’s get you started!",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: "Lato"),
                      ),
                      SizedBox(
                        height: 41.h,
                      ),
                      AppTextField(
                        controller: vm.txtEmail,
                        hintText: "Your email",
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      AppFieldPassword(
                        controller: vm.txtPwd,
                        hintText: "Your password",
                      ),
                      SizedBox(
                        height: 49.h,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                                "assets/icons/icon_checkbox_true.svg"),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              "I am over 16 years of age",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 29.h,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        //By clicking Sign Up, you are indicating that you have read and agree to the Terms of Service and Privacy Policy
                        TextSpan(
                            text:
                                "By clicking Sign Up, you are indicating that you have read and agree to the ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.5))),
                        TextSpan(
                            text: "Terms of Service ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).primaryColor)),
                        TextSpan(
                            text: "and ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.5))),
                        TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).primaryColor)),
                      ])),
                      SizedBox(
                        height: 29.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          InkWell(
                            onTap: vm.signUp,
                            child: SvgPicture.asset(
                                "assets/icons/icon_button_sign_up.svg"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
