// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learning_app/common/apis/user_api.dart';
import 'package:learning_app/common/entities/entities.dart';
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
          debugPrint("===Email is: $emailAddress===");
        }
        if (password.isEmpty) {
          ///show message:
          toastInfo(msg: "You need to fill password");
          return;
        } else {
          debugPrint("===Password is : $password===");
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
            debugPrint("===User is verified===");
          }
          if (credential.user == null) {
            ///show message
            toastInfo(msg: "You don't exits");
            return;
          } else {
            debugPrint("===User exits===");
            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil("/application", (route) => false);
          }
          var user = credential.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            loginRequestEntity.avatar = photoUrl;
            //type 1 means email login
            loginRequestEntity.type = 1;

            await asyncPostAllData(loginRequestEntity);
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
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );

    final result =
        await UserApi.login(params: loginRequestEntity);
    if (result.code == 200) {
      try {
        Global.storageService.setString(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data));
        Global.storageService.setString(
          AppConstants.STORAGE_USER_TOKEN_KEY,
          result.data!.access_token!,
        );
        EasyLoading.dismiss();
        toastInfo(msg: result.msg!);
        Navigator.pushNamedAndRemoveUntil(
            context, "/application", (route) => false);
      } catch (e) {
        debugPrint("Saving local storage error: ${e.toString()}");
      }
    }else{
      EasyLoading.dismiss();
      toastInfo(msg: "Something went wrong!");
    }
  }
}
