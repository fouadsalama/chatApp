part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatCubitInitial extends ChatState {}

class ChatSuccess extends ChatState {
  List<Message> messageList = [];

  ChatSuccess({required this.messageList});
}
