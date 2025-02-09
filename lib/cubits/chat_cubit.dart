import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

 bool isTyping = false;

 void onTyping(){
   print('typing');
   isTyping = true;
    emit(ChatLoading());
  }
}
