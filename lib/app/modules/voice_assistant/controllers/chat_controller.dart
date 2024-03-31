
import 'package:codeshastra/app/modules/voice_assistant/controllers/voice_assistant_controller.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:get/get.dart';

class ChatController extends GetxController {
  final stt.SpeechToText speech = stt.SpeechToText();
  final RxBool hasPermission = RxBool(false); // Reactive variable for permission status
  final RxString recognizedText = RxString(''); // Reactive variable for recognized text
  final RxString status = "notListening".obs;
  @override
  void onInit() {
    initializeSpeech();
    super.onInit();
  }
  Future<void> initializeSpeech() async {
    bool available = await speech.initialize(
      onStatus: statusListener,
      onError: errorListener,
    );
    hasPermission.value = available;
  }

void listenForSpeech(String locale) async {
  // if (hasPermission.value) {
    speech.listen(onResult: resultListener, localeId: locale);
  
}


  void stopListening() {
    speech.stop();
  }

  void statusListener(String status) {
    // Handle status updates (e.g., listening started/stopped)
    if(status=="done"){
    Get.find<VoiceAssistantController>().sendMessage(recognizedText.value);
    }
    this.status.value = status;
  }

  void errorListener(SpeechRecognitionError error) {
    // Handle errors during speech recognition
  }

  void resultListener(SpeechRecognitionResult result) {
    recognizedText.value = result.recognizedWords;

    // Update text field or create a new message with recognized text
  }
}
