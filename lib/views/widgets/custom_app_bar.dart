import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/assets_manager.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 60.h,
     elevation: 2,
     title: const Text('Chat GPT'),
   /* bottom: PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 7.w,
          vertical: 15.h,
        ),
        child: Row(
          children: [
            Image.asset(
              AssetsManager.openaiLogo,
              height: 40.h,
              width: 50.w,
            ),
            Text(
              'Chat GPT',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),*/
    leading: Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: Image.asset(AssetsManager.openaiLogo,
          ),
        ),
    actions: [
          Icon(Icons.more_vert,
          color: Colors.white,
          ),
        ],
  );
}