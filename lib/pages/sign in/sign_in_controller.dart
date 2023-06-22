import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/sign%20in/bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn({required String type}) async {
    try {
      if (type == "email") {
        ///for access bloc property
        ///BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        final emailAddress = state.email;
        final password = state.password;
        if (emailAddress.isEmpty) {
          ///show message:
        }
        if (password.isEmpty) {
          ///show message:
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if(credential.user == null){
            ///show message
          }
          if(!credential.user!.emailVerified){
            ///show message
          }
          var user = credential.user;
          if(user !=null){
            ///we got verified user from firebase
          }else{
            ///we have error getting user from firebase
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
