// ignore_for_file: prefer_const_constructors

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/common/widgets/base_text_widget.dart';
import 'package:learning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:learning_app/pages/home/bloc/home_page_events.dart';
import 'package:learning_app/pages/home/bloc/home_page_states.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 12.h,
            width: 15.w,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/person.png"))),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color? textColor = AppColors.primaryText, double top = 20.0}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

///for search bar
Widget searchView() {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: AppColors.primaryFourthElementText),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w),
                width: 16.w,
                height: 16.w,
                child: Image.asset("assets/icons/search.png"),
              ),
              Expanded(
                child: SizedBox(
                  height: 40.h,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp,
                      fontFamily: "Avenir",
                    ),
                    autocorrect: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: "search your course",
                      contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
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
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: 5.w),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(13.r),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

///for slider
Widget slidersView(
    {required BuildContext context, required HomePageStates state}) {
  return Column(
    children: [
      Container(
        width: 325.w,
        height: 160.h,
        margin: EdgeInsets.only(top: 20.h),
        child: PageView(
          onPageChanged: (int value) {
            print("=== $value ===");
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(imgPath: "assets/icons/art.png"),
            _slidersContainer(imgPath: "assets/icons/image_1.png"),
            _slidersContainer(imgPath: "assets/icons/image_2.png"),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
        position: state.index,
        decorator: DotsDecorator(
          color: AppColors.primaryThirdElementText,
          activeColor: AppColors.primaryElement,
          size: Size.square(5.0),
          activeSize: Size(17.w, 5.h),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
      ),
    ],
  );
}

///sliders widget
Widget _slidersContainer({required String imgPath}) {
  return Container(
    width: 325.w,
    height: 160.h,
    margin: EdgeInsets.only(right: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      image: DecorationImage(
        image: AssetImage(imgPath),
        fit: BoxFit.fill,
      ),
    ),
  );
}

/// menu view
Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText("Choose your course"),
            InkWell(
              onTap: () {},
              child: reusableText(
                "See all",
                color: AppColors.primaryThirdElementText,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 20.h),
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText("Popular",
                textColor: AppColors.primaryThirdElementText,
                bgColor: Colors.white),
            _reusableMenuText("Newest",
                textColor: AppColors.primaryThirdElementText,
                bgColor: Colors.white),
          ],
        ),
      ),
    ],
  );
}

///for menu buttons, reusable text
Widget _reusableMenuText(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color bgColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(7.r),
      border: Border.all(color: bgColor),
    ),
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
    child: reusableText(
      menuText,
      color: textColor,
      fontWeight: FontWeight.normal,
      fontSize: 11,
    ),
  );
}

///for course grid view ui
Widget courseGrid() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),
      image: DecorationImage(
        image: AssetImage("assets/icons/image_2.png"),
        fit: BoxFit.fill,
      ),
    ),
    child: Container(
      padding: EdgeInsets.all(12.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Best Course for IT & Engineering",
            maxLines: 1,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
              color: AppColors.primaryElementText,
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "30 Lessons",
            maxLines: 1,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
              color: AppColors.primaryFourthElementText,
              fontSize: 8.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}
