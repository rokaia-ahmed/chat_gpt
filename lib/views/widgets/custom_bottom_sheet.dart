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
                  controller:BlocProvider.of<ChatCubit>(context).textController ,
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.w),
                    hintText: 'how can I help you?',
                    hintStyle: TextStyle(
                      color: Colors.grey,

                    ),
                  ),
                  onFieldSubmitted: (value) {
                    BlocProvider.of<ChatCubit>(context).chatMessage();
                  },
                ),
              ),
              GestureDetector(onTap: () {
                BlocProvider.of<ChatCubit>(context).chatMessage();
              },
                  child: Icon(Icons.send,
                    color: Colors.white,
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
