import 'dart:io';

import 'package:get/get.dart';
import 'package:google_gemini/google_gemini.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiProvider extends GetConnect {
  final gemini = GoogleGemini(
  apiKey: dotenv.env['GEMINI_API_KEY']!,
);
  
    Future<String> getResponseWithImage(String query,File image) async {
      try{
      final res= await gemini.generateFromTextAndImages(
        query: query,
        image: image
      );
      
      return res.text;
      }catch(e){
        print("Error: $e");
        return "क्षमा करें, लेकिन मैं आपका प्रश्न नहीं समझ सका";
      }
    }

    Future<String> getResponse(String query) async {
      print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
      print("Query: $query");
      try{
        final res= await gemini.generateFromText(query);
        return res.text;
      }catch(e){
        print("Error: $e");
        return "क्षमा करें, लेकिन मैं आपका प्रश्न नहीं समझ सका";
      }
    }

}
