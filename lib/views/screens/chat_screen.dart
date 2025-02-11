import 'package:chat_gpt/core/constants/app_colors.dart';
import 'package:chat_gpt/core/constants/assets_manager.dart';
import 'package:chat_gpt/cubits/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_sheet.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ChatCubit(),
      child: Scaffold(
        appBar: customAppBar(context),
        bottomNavigationBar: CustomBottomSheet(),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: 5,
                    padding: EdgeInsets.all(10),
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 10.h,
                        ),
                    itemBuilder: (context, index) =>
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Image.asset(AssetsManager.userImage,
                                  height: 40.h,
                                  width: 40.w,
                                ),
                                Expanded(
                                  child: Text('sender',
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
                                children: [
                                  Image.asset(AssetsManager.chatLogo,
                                    height: 30.h,
                                    width: 30.w,
                                  ),
                                  Expanded(
                                    child: Text('receiver',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                  ),
                ),
                if(BlocProvider.of<ChatCubit>(context).isTyping==true)
                  const SpinKitThreeBounce(
                    color: Colors.white,
                    size: 18,
                  ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
