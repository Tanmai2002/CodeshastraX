
import 'package:codeshastra/app/modules/voice_assistant/controllers/chat_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/voice_assistant_controller.dart';

class VoiceAssistantView extends GetView<VoiceAssistantController> {
  late ChatController chat_controller;
  //  VoiceAssistantView({Key? key}) : super(key: key);
  
  VoiceAssistantView(){
    chat_controller=Get.find<ChatController>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: Text('Select Language'),
                  content:  Column(
                        children: controller.languageController.languages
                            .map((e) => ListTile(
                                  title: Text(e['name']!),
                                  onTap: () {
                                    controller.languageController.selectedLanguage.value = e["code"]!;
                                    Get.back();
                                  },
                                ))
                            .toList(),
                      )),
                
              );
            },
          ),
        ],
      ),
      
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                  // Use Obx for reactive updates
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    return _buildMessage(controller.messages[index]);
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Obx((){
                    if(chat_controller.status.value=="listening"){
                      return Center(
                        child:SizedBox(child:  CircularProgressIndicator(),width: 30,height: 30,)
                      );
                    }
                    return TextField(
                      controller: controller.textController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                      ),
                    );
                  })
                ),
                 IconButton(
                icon: Icon(Icons.mic),
                onPressed: () => Get.find<ChatController>().listenForSpeech(controller.languageController.selectedLanguage.value),
              ),
              IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () =>
                      controller.sendMessage(controller.textController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildMessage(ChatMessage message) {
  Widget _buildMessage(ChatMessage message) {
    if (message.sender == 'user') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(message.content),
            ),
          ),
          SizedBox(width: 10.0),
        ],
      );
    } else {
      return Row(
        children: [
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey[400]!,
                ),
              ),
              child: Text(message.content),
            ),
          ),
        ],
      );
      // }
    }
  }
}
