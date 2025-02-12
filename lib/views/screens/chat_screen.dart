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
      create: (context) => ChatCubit(),
      child: Scaffold(
        appBar: customAppBar(context),
        bottomNavigationBar: CustomBottomSheet(),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: state is ChatSuccess? ListView.separated(
                    itemCount:  state.messages.length,
                    padding: EdgeInsets.all(10),
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 10.h,
                        ),
                    itemBuilder: (context, index) =>
                    ChatWidget(textController:
                      BlocProvider.of<ChatCubit>(context).textController.text,
                      model: state.messages[index],),
                  ):Container(),
                ),
                if(state is ChatLoading)
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
