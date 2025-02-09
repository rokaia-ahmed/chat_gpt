import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../cubits/chat_cubit.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Container(
          height: 55.h,
          color: AppColors.cardColor,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: Colors.white.withValues(alpha: 0.6),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 5.w),
                  ),
                  onChanged: (value) {
                    BlocProvider.of<ChatCubit>(context).onTyping();
                  },
                ),
              ),
              InkWell(onTap: () {},
                  child: Icon(Icons.send,
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        );
      },
    );
  }
}
