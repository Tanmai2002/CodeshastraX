import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class ChatMessage {
  final String sender;
  final String content;

  ChatMessage({required this.sender, required this.content});
}
class VoiceAssistantController extends GetxController {

 final textController = TextEditingController();
  RxList<ChatMessage> messages = <ChatMessage>[].obs;

  void sendMessage(String text) {
    messages.add(ChatMessage(sender: 'user', content: text));
    textController.clear(); // Clear text field after sending
    
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
