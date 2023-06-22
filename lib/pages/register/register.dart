// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(title: "Sign Up"),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Center(
                  child: reusableText(
                    text: "Enter your details bellow & free sign up",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.symmetric(horizontal: 25.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText(text: "User name"),
                      buildTextField(
                        hintText: "Enter your user name",
                        textType: "username",
                        iconName: 'user',
                        func: (value) {
                          // context.read<SignInBloc>().add(EmailEvent(value));
                        },
                      ),
                      reusableText(text: "Email"),
                      buildTextField(
                        hintText: "Enter your email address",
                        textType: "email",
                        iconName: 'user',
                        func: (value) {
                          // context.read<SignInBloc>().add(EmailEvent(value));
                        },
                      ),
                      reusableText(text: "Password"),
                      buildTextField(
                        hintText: "Enter your password",
                        textType: "password",
                        iconName: 'lock',
                        func: (value) {
                          // context
                          //     .read<SignInBloc>()
                          //     .add(PasswordEvent(value));
                        },
                      ),
                      reusableText(text: "Re-enter Password"),
                      buildTextField(
                        hintText: "Re-enter your password to confirm",
                        textType: "password",
                        iconName: 'lock',
                        func: (value) {
                          // context
                          //     .read<SignInBloc>()
                          //     .add(PasswordEvent(value));
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: reusableText(
                    text:
                        "By creating an account you have to agree\n with our terms & conditions",
                  ),
                ),
                buildLoginAndRegistrationButton(
                  buttonName: "Sign Up",
                  buttonType: "login",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
