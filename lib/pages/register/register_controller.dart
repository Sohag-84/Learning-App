// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can't be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email address can't be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can't be empty");
      return;
    }
    if (rePassword.contains(password)) {
      toastInfo(msg: "Your password confirmation is wrong");
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: "An email has been sent to your registered email.");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is to weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The email is already in use");
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "Provide a valid email");
      }
    }
  }
}
