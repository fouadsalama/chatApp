import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/models/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatCubitInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  List<Message> messageList = [];
  void sendMessage({required String data, required dynamic email}) {
    try {
      messages.add(
        {KMessage: data, KCreatedAt: DateTime.now(), 'id': email},
      );
    } on Exception catch (e) {
      // TODO
    }
  }

  void getMessage() {
    messages.orderBy(KCreatedAt, descending: true).snapshots().listen((event) {
      messageList.clear();
      for (var doc in event.docs) {
        messageList.add(Message.fromJson(doc));
      }

      print('success');

      emit(ChatSuccess(messageList: messageList));
    });
  }
}
