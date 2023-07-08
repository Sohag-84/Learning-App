// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 18.w,
          height: 12.h,
          child: Image.asset("assets/icons/menu.png"),
        ),
        Text(
          "Profile",
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Image.asset("assets/icons/more-vertical.png"),
        ),
      ],
    ),
  );
}

/// profile icon and edit button
Widget profileAndEditButton() {
  return Container(
    width: 80.w,
    height: 80.h,
    padding: EdgeInsets.only(right: 6.w),
    alignment: Alignment.bottomRight,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: DecorationImage(
          image: AssetImage("assets/icons/headpic.png"),
        )),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: AssetImage("assets/icons/edit_3.png"),
    ),
  );
}

///settings section buttons
var imagesInfo = <String, String>{
  'Settings': "settings.png",
  'Payment details': "credit-card.png",
  'Achievement': "award.png",
  'Love': "heart(1).png",
  'Reminders': "cube.png",
};
Widget buildListView() {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  child: Image.asset(
                      "assets/icons/${imagesInfo.values.elementAt(index)}"),
                ),
                SizedBox(width: 15.w),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
