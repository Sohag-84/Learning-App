// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/sign%20in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context: context),
                Center(
                  child: reusableText(text: "Or use your email account login"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.symmetric(horizontal: 25.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText(text: "Email"),
                      SizedBox(height: 5.h),
                      buildTextField(
                        hintText: "Enter your email address",
                        textType: "email",
                        iconName: 'user',
                      ),
                      reusableText(text: "Password"),
                      SizedBox(height: 5.h),
                      buildTextField(
                        hintText: "Enter your password",
                        textType: "password",
                        iconName: 'lock',
                      ),
                    ],
                  ),
                ),
                forgotPassword(),
                buildLoginAndRegistrationButton(
                  buttonName: "Login",
                  buttonType: "Login",
                ),
                buildLoginAndRegistrationButton(
                  buttonName: "Register",
                  buttonType: "registration",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
