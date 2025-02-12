import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/assets_manager.dart';
import '../../models/chat_response_model.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.textController,
    required this.model});
 final String textController;
 final  ChatResponseModel model ;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Image.asset(AssetsManager.userImage,
              height: 40.h,
              width: 40.w,
            ),
            Expanded(
              child: Text(model.choices![0].message!.sender??'',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          color: AppColors.cardColor,
          padding: EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AssetsManager.chatLogo,
                height: 30.h,
                width: 30.w,
              ),
              Expanded(
                child: Text(
                  model.choices![0].message!.content??'',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
