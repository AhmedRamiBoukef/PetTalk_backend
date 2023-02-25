import 'package:pe_talk/models/message.dart';
import 'package:flutter/widgets.dart';

class DiscussionController extends ChangeNotifier {
  TextEditingController messageController = TextEditingController(text: '');
  late List<Message> messages;

  DiscussionController() {
    messages = [
      Message(text: 'Hmmm yy', sent: false),
      Message(text: 'Okkk ??'),
      Message(text: 'Yes Yes', sent: false),
      Message(text: 'And you!??', sent: false),
      Message(text: 'Hmm Fine'),
      Message(text: 'Sure ??!!', sent: false),
      Message(text: 'A bit'),
      Message(text: 'Out please please', sent: false),
    ].reversed.toList();
  }

  void sentMessage() {
    Message message = Message(text: messageController.text);
    messages.insert(0, message);
    messageController.text = '';
    notifyListeners();
  }
}
