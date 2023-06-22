// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/sign%20in/bloc/signin_bloc.dart';
import 'package:learning_app/pages/sign%20in/signin.dart';
import 'package:learning_app/pages/welcome/blocs/welcome_blocs.dart';
import 'package:learning_app/pages/welcome/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WelcomeBlocs>(
          create: (context) => WelcomeBlocs(),
        ),
        BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 690),
        builder: (context, child) {
          return MaterialApp(
            title: 'Learning App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
            ),
            home: Welcome(),
            routes: {
              "signIn": (context) => SignIn(),
            },
          );
        },
      ),
    );
  }
}
