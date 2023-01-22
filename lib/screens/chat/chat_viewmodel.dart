import 'package:tawasol_app/base.dart';
import 'package:tawasol_app/database_utils/database_utils.dart';
import 'package:tawasol_app/models/message.dart';
import 'package:tawasol_app/models/my_user.dart';
import 'package:tawasol_app/models/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatViewModel extends BaseViewModel<ChatNavigator> {
  late Room room;
  late MyUser myUser;

  void sendMessage(String content) {
    if (content.trim().isEmpty) return;
    Message message = Message(
        content: content,
        dateTime: DateTime.now().millisecondsSinceEpoch,
        senderId: myUser.id,
        senderName: myUser.userName,
        roomId: room.id);
    DataBaseUtils.addMessageToFirestore(message).then((value) {
      navigator!.clearMessage();
    }).catchError((error) {
      navigator!.showMessage(error.toString());
    });
  }

  Stream<QuerySnapshot<Message>> getMessages() {
    return DataBaseUtils.readMessagesFromFirestore(room.id);
  }
}

abstract class ChatNavigator extends BaseNavigator {
  void clearMessage();
}
