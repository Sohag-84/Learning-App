// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(){
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(
        height: 1.h,
        color: Colors.grey.withOpacity(.5),
      ),
    ),
    title: Text(
      "Log In",
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
    ),
    centerTitle: true,
  );
}