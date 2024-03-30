import 'package:codeshastra/app/modules/voice_assistant/controllers/chat_controller.dart';
import 'package:get/get.dart';

import '../controllers/voice_assistant_controller.dart';

class VoiceAssistantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoiceAssistantController>(
      () => VoiceAssistantController(),
    );
    Get.put(ChatController());
  }
}
