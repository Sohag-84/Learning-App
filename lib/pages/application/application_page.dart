import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/pages/application/widget/application_widget.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Container(
            height: 58.h,
            width: 375.w,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.w),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 1,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourthElementText,
              currentIndex: currentIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/home.png"),
                  ),
                  activeIcon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset(
                      "assets/icons/home.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Search",
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/search.png"),
                  ),
                  activeIcon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset(
                      "assets/icons/search.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Course",
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/play-circle1.png"),
                  ),
                  activeIcon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset(
                      "assets/icons/play-circle1.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Chat",
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/message-circle.png"),
                  ),
                  activeIcon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset(
                      "assets/icons/message-circle.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/person2.png"),
                  ),
                  activeIcon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset(
                      "assets/icons/person.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: buildPage(index: currentIndex),
        ),
      ),
    );
  }
}
