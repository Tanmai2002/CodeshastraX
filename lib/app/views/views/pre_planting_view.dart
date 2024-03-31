import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PrePlantingView extends GetView {
  PrePlantingView({Key? key}) : super(key: key);

  List<Map<String,String>> farming_videos=[
    {
      'name':'how to grow rice',
      'video_id':'iLnmTe5Q2Qw',
      'runtime': '10:00',
      'image':'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.agrifarming.in%2Fhow-to-grow-rice&psig=AOvVaw3'
    },
    {
      'name':'how to grow wheat',
      'video_id':'iLnmTe5Q2Qw',
      'runtime': '10:00',
      'image':'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.agrifarming.in%2Fhow-to-grow-rice&psig=AOvVaw3'
    },
    {
      'name':'how to grow maize',
      'video_id':'iLnmTe5Q2Qw',
      'runtime': '10:00',
      'image':'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.agrifarming.in%2Fhow-to-grow-rice&psig=AOvVaw3'
    },
    {
      'name':'how to grow sugarcane',
      'video_id':'iLnmTe5Q2Qw',
      'runtime': '10:00',
      'image':'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.agrifarming.in%2Fhow-to-grow-rice&psig=AOvVaw3'
    },
    {
      'name':'how to grow cotton',
      'video_id':'iLnmTe5Q2Qw',
      'runtime': '10:00',
      'image':'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.agrifarming.in%2Fhow-to-grow-rice&psig=AOvVaw3'
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text('28 C'),
              subtitle: Text('Temperature ${DateTime.now().toLocal()}'),
            ),
            Text('Educational Videos',style: TextStyle(fontSize: 20),),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.video_collection),
                    title: Text(farming_videos[index]['name']!),
                    subtitle: Text(farming_videos[index]['runtime']!),
                    onTap: (){
                      Get.to(YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: farming_videos[index]['video_id']!,
                          flags: YoutubePlayerFlags(
                            autoPlay: true,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blue,
                        progressColors: ProgressBarColors(
                          playedColor: Colors.blue,
                          handleColor: Colors.blueAccent,
                        ),
                      ));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
