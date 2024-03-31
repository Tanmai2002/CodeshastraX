import 'package:codeshastra/app/data/gemini_provider.dart';
import 'package:codeshastra/app/modules/language/controllers/language_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:google_translate/components/google_translate.dart';
class ChatMessage {
  final String sender;
  final String content;

  ChatMessage({required this.sender, required this.content});
}
class VoiceAssistantController extends GetxController {
  FlutterTts flutterTts = FlutterTts();


 final textController = TextEditingController();
  RxList<ChatMessage> messages = <ChatMessage>[].obs;
  RxBool isUserInput = true.obs;
  final geminiProvider=GeminiProvider();
  late LanguageController languageController;

  void sendMessage(String text) async{
    messages.add(ChatMessage(sender: 'user', content: text));
    textController.clear(); // Clear text field after sending
    isUserInput.value = false;
    String translated=text;
    print(translated);
    geminiProvider.getResponse(
      "Assume a Farmer needs Your help in few things.Keep it simple and direct.This is the message he sent: $translated."
     
    ).then((value) async{
      messages.add(ChatMessage(sender: 'assistant', content: value));
      flutterTts.speak(value).then((value){
      isUserInput.value = true;
      });
    });
      
    // Simulate a response from the assistant

    
  }
 
 


  @override
  void onInit() {
    languageController=Get.find<LanguageController>();
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
