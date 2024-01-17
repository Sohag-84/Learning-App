// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/values/constant.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/sign%20in/bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn({required String type}) async {
    try {
      if (type == "email") {
        ///for access bloc property
        ///BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        final emailAddress = state.email;
        final password = state.password;
        if (emailAddress.isEmpty) {
          ///show message:
          toastInfo(msg: "You need to fill email address");
          return;
        } else {
          print("===Email is: $emailAddress===");
        }
        if (password.isEmpty) {
          ///show message:
          toastInfo(msg: "You need to fill password");
          return;
        } else {
          print("===Password is : $password===");
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          if (!credential.user!.emailVerified) {
            ///show message
            toastInfo(msg: "You need to verify your email account");
            return;
          } else {
            print("===User is verified===");
          }
          if (credential.user == null) {
            ///show message
            toastInfo(msg: "You don't exits");
            return;
          } else {
            print("===User exits===");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
          }
          var user = credential.user;
          if (user != null) {
            ///we got verified user from firebase
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456");
            Navigator.pushNamedAndRemoveUntil(
                context, "/application", (route) => false);
          } else {
            ///we have error getting user from firebase
            toastInfo(msg: "Currently you are not a user on this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-email') {
            toastInfo(msg: 'Your email format is wrong');
          } else if (e.code == 'user-not-found') {
            toastInfo(msg: 'user not found for that email.');
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'Wrong password provided for that user');
          }
        }
      }
    } catch (e) {}
  }
}
