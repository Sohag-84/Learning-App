// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/pages/app_bloc_provider.dart';
import 'package:learning_app/pages/application/application_page.dart';
import 'package:learning_app/pages/register/register.dart';
import 'package:learning_app/pages/sign%20in/signin.dart';
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
      providers: AppBlocProviders.allBlocProviders,
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
                iconTheme: IconThemeData(color: AppColors.primaryText)
              ),
            ),
            home: ApplicationPage(),
            routes: {
              "signIn": (context) => SignIn(),
              "register": (context) => Register(),
            },
          );
        },
      ),
    );
  }
}
