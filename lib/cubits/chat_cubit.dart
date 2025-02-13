import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/constants.dart';
import '../models/chat_response_model.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  final TextEditingController textController = TextEditingController();

  List<ChatResponseModel> messages = [];
  List<String> sender = [];
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
         saveMessages(chatResponseModel!,textController.text);
        textController.clear();
         emit(ChatSuccess());
      }else{
        debugPrint('Error 1: ${response.statusCode}');
      }
   }catch(e){
     debugPrint('Error 2: ${e.toString()}');
     emit(ChatError(e.toString()));
   }
  }

  Future<void> saveMessages(ChatResponseModel message,String senderMs) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    messages.add(message);
    sender.add(senderMs);
    // Convert list of objects to list of JSON maps
    List<String> jsonMessages =
    messages.map((msg) => jsonEncode(msg.toJson())).toList();
    List<String> jsonSender =
    sender.map((msg) => jsonEncode(msg)).toList();

    await prefs.setStringList('chatMessages', jsonMessages);
    await prefs.setStringList('senderMessages', jsonSender);
  }

  void loadMessages() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? jsonMessages = prefs.getStringList('chatMessages');
    List<String>? jsonSender = prefs.getStringList('senderMessages');

    if (jsonMessages != null && jsonSender != null) {
      messages.addAll(jsonMessages.map((msg) =>
          ChatResponseModel.fromJson(jsonDecode(msg))).toList());
      sender.addAll(jsonSender.map((msg) => jsonDecode(msg)));
      emit(ChatSuccess());
    }
  }
}
