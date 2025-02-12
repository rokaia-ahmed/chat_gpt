import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../core/constants/constants.dart';
import '../models/chat_response_model.dart';
part 'chat_state.dart';

class ChatCubit extends HydratedCubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  final TextEditingController textController = TextEditingController();

  List<ChatResponseModel> messages = [];
  ChatResponseModel? chatResponseModel ;
  void chatMessage()async{
   Uri url = Uri.parse('https://api.openai.com/v1/chat/completions');
   emit(ChatLoading());
   try{
      Response response =  await http.post(url,
     headers: {
       'Content-Type': 'application/json',
       'Authorization': 'Bearer $apiKey',
     },
     body: jsonEncode({
       'model': 'gpt-4o-mini',
       'messages': [
         {
           'role': 'user',
           'content': textController.text,
         }
       ]
     }),
     );
      if(response.statusCode == 200) {
        final data = jsonDecode(response.body);
        chatResponseModel = ChatResponseModel.fromJson(data);
        chatResponseModel!.choices![0].message!.sender =textController.text ;
         messages.add(chatResponseModel??ChatResponseModel());
         textController.clear();

         emit(ChatSuccess(messages));
      }else{
        debugPrint('Error 1: ${response.statusCode}');
      }
   }catch(e){
     debugPrint('Error 2: ${e.toString()}');
     emit(ChatError(e.toString()));
   }
  }

  @override
  ChatState? fromJson(Map<String, dynamic> json) {
    return ChatSuccess(List.from(json['chat']).isNotEmpty?
    List.from(json['chat']):[]);
  }

  @override
  Map<String, dynamic>? toJson(ChatState state) {
      return {'chat': state is ChatSuccess?
      state.messages.map((e)=>e.toJson()).toList():[]};
  }
}
