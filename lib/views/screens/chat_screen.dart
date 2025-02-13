import 'package:chat_gpt/cubits/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../widgets/chat_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_sheet.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ChatCubit()..loadMessages(),
      child: Scaffold(
        appBar: customAppBar(context),
        bottomSheet: CustomBottomSheet(),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state)  {
            var cubit = BlocProvider.of<ChatCubit>(context);
            return Column(
              children: [
                Expanded(
                  child: cubit.messages.isNotEmpty?
                  ListView.separated(
                    itemCount:  cubit.messages.length,
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom + 75,
                    left: 10,top: 10 , right: 10 ,
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 10.h,
                        ),
                    itemBuilder: (context, index) =>
                    ChatWidget(
                      model: cubit.messages[index],
                      sender: cubit.sender[index],
                    ),
                  ):Container(),
                ),
                if(state is ChatLoading)
                  Column(
                    children: [
                      const SpinKitThreeBounce(
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(
                        height: 65.h,
                      ),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
