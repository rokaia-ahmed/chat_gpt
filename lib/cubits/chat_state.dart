part of 'chat_cubit.dart';

@immutable
sealed class ChatState {
}

final class ChatInitial extends ChatState {
}

final class ChatLoading extends ChatState {
}
final class ChatSuccess extends ChatState {
  final List<ChatResponseModel> messages;
  ChatSuccess(this.messages);
}
final class ChatError extends ChatState {
   final String error;
    ChatError(this.error);
}
