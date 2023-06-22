// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(
        ///height means thickness of the line
        height: 1.h,
        color: AppColors.primarySecondaryBackground,
      ),
    ),
    title: Text(
      "Log In",
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
    centerTitle: true,
  );
}

/// we need context for accessing bloc
Widget buildThirdPartyLogin({required BuildContext context}) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.symmetric(horizontal: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcon(iconName: "google", onTap: () {}),
        _reusableIcon(iconName: "apple", onTap: () {}),
        _reusableIcon(iconName: "facebook", onTap: () {}),
      ],
    ),
  );
}

///for social login icon logo
Widget _reusableIcon({required String iconName, required final onTap}) {
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      height: 40.h,
      width: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

///for text
Widget reusableText({required String text}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Colors.grey.withOpacity(.8),
      ),
    ),
  );
}

///for text input field
Widget buildTextField(
    {required String hintText,
    required String textType,
    required String iconName,
    required void Function(String value)? func}) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(color: AppColors.primaryFourthElementText),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          margin: EdgeInsets.only(left: 15.w),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            keyboardType: TextInputType.multiline,
            onChanged: (value) => func!(value),
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
              fontFamily: "Avenir",
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

/// for forgot password text
Widget forgotPassword() {
  return Container(
    width: 260.w,
    height: 44.h,
    margin: EdgeInsets.only(left: 25.w),
    child: InkWell(
      onTap: () {},
      child: Text(
        "Forgot password",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.underline,
          color: AppColors.primaryText,
          decorationColor: AppColors.primaryText,
        ),
      ),
    ),
  );
}

/// login and registration button
Widget buildLoginAndRegistrationButton({
  required String buttonName,
  required String buttonType,
  required void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 325.h,
      height: 50.h,
      margin: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        top: buttonType == "Login" ? 40.h : 20.h,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: buttonType == "Login"
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: buttonType == "Login"
              ? Colors.transparent
              : AppColors.primaryFourthElementText,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
            color: Colors.grey.withOpacity(.1),
          ),
        ],
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: buttonType == "Login"
              ? AppColors.primaryBackground
              : AppColors.primaryText,
        ),
      ),
    ),
  );
}
