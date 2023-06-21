// ignore_for_file: prefer_const_constructors

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/pages/welcome/blocs/welcome_blocs.dart';
import 'package:learning_app/pages/welcome/blocs/welcome_events.dart';
import 'package:learning_app/pages/welcome/blocs/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBlocs, WelcomeState>(
          builder: (context, state) {
            return Container(
              width: 375.h,
              margin: EdgeInsets.only(top: 34.h),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (int index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBlocs>(context)
                          .add(WelcomeEvents());
                    },
                    children: [
                      _page(
                        index: 1,
                        context: context,
                        buttonName: "Next",
                        title: "First See Learning",
                        subtitle:
                            "Forget about a for of paper all knowledge in one learning",
                        imagePath: "assets/images/reading.png",
                      ),
                      _page(
                        index: 2,
                        context: context,
                        buttonName: "Next",
                        title: "Connect With Everyone",
                        subtitle:
                            "Always keep in touch with your tutor & friend. Let's get connected.",
                        imagePath: "assets/images/boy.png",
                      ),
                      _page(
                        index: 3,
                        context: context,
                        buttonName: "Get Started",
                        title: "Always Fascinated Learning",
                        subtitle:
                            "Anywhere anytime. The time is at your discretion so study whenever you want.",
                        imagePath: "assets/images/man.png",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 50.h,
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: state.page,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThirdElementText,
                        activeColor: AppColors.primaryElement,
                        size: Size.square(8.0),
                        activeSize: Size(15, 8),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(
      {required int index,
      required BuildContext context,
      required String buttonName,
      required String title,
      required String subtitle,
      required String imagePath}) {
    return Column(
      children: [
        SizedBox(
          height: 345.h,
          width: 345.w,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 24.sp, color: AppColors.primaryText),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            if (index < 3) {
              ///set animation
              pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            } else {
              ///jump to another page
              Navigator.pushNamedAndRemoveUntil(
                context,
                "signIn",
                (route) => false,
              );
            }
          },
          child: Container(
            height: 50.h,
            width: 325.w,
            margin: EdgeInsets.only(
              top: 100.h,
              left: 25.w,
              right: 25.w,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Text(
              buttonName,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
