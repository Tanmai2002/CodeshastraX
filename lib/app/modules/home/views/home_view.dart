import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isCheck = false; // Example boolean variable, replace it with your logic

    return Scaffold(
      appBar: AppBar(
        title: const Text('KhetiSeva'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Timeline.tileBuilder(
              theme: TimelineThemeData(
                direction: Axis.horizontal,
                connectorTheme: const ConnectorThemeData(
                  space: 35.0,
                  thickness: 5.0,
                  color: Colors.green,
                ),
              ),
              builder: TimelineTileBuilder.connected(
                indicatorBuilder: (context, index) {
                  return Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 95, 57, 43),
                    ),
                    child: Center(
                      child: isCheck
                          ? Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : Text(
                              '${index + 1}',
                              style: const TextStyle(color: Colors.white),
                            ),
                    ),
                  );
                },
                contentsAlign: ContentsAlign.basic,
                contentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text('Timeline Event $index'),
                ),
                itemCount: 3,
                connectorBuilder: (_, index, __) => const SolidLineConnector(
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
