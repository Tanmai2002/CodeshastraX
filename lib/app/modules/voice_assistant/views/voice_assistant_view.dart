
import 'package:codeshastra/app/modules/voice_assistant/controllers/chat_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/voice_assistant_controller.dart';

class VoiceAssistantView extends GetView<VoiceAssistantController> {
  const VoiceAssistantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
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
                  child: TextField(
                    controller: controller.textController,
                    decoration: InputDecoration(
                        hintText: 'Type your message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                IconButton(
                icon: Icon(Icons.mic),
                onPressed: () => Get.find<ChatController>().listenForSpeech(),
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
