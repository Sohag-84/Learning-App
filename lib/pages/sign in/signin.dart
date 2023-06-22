// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/sign%20in/bloc/signin_bloc.dart';
import 'package:learning_app/pages/sign%20in/bloc/signin_event.dart';
import 'package:learning_app/pages/sign%20in/bloc/signin_state.dart';
import 'package:learning_app/pages/sign%20in/sign_in_controller.dart';
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
            child: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context: context),
                    Center(
                      child: reusableText(
                        text: "Or use your email account login",
                      ),
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
                            func: (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            },
                          ),
                          reusableText(text: "Password"),
                          SizedBox(height: 5.h),
                          buildTextField(
                            hintText: "Enter your password",
                            textType: "password",
                            iconName: 'lock',
                            func: (value) {
                              context
                                  .read<SignInBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                        ],
                      ),
                    ),
                    forgotPassword(),
                    buildLoginAndRegistrationButton(
                      buttonName: "Login",
                      buttonType: "Login",
                      onTap: () {
                        SignInController(context: context)
                            .handleSignIn(type: "email");
                      },
                    ),
                    buildLoginAndRegistrationButton(
                      buttonName: "Register",
                      buttonType: "registration",
                      onTap: () {},
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
