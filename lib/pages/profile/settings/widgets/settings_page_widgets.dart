// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/widgets/base_text_widget.dart';

///for app bar
AppBar buildAppBar() {
  return AppBar(
    title: reusableText("Settings"),
    centerTitle: true,
  );
}

///for log out
Widget settingsButton(
    {required BuildContext context, required void Function()? func}) {
  return InkWell(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirm logout"),
            content: Text("Confirm logout"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: func,
                child: Text("Confirm"),
              ),
            ],
          );
        },
      );
    },
    child: Container(
      height: 100.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/icons/Logout.png"),
          fit: BoxFit.fitHeight,
        ),
      ),
    ),
  );
}
