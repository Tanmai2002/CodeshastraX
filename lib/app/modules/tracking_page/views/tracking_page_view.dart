import 'package:codeshastra/app/views/views/planting_view.dart';
import 'package:codeshastra/app/views/views/pre_planting_view.dart';
import 'package:codeshastra/app/views/views/sale_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

import '../controllers/tracking_page_controller.dart';

class TrackingPageView extends GetView<TrackingPageController> {
  const TrackingPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Expanded(
            child: Timeline.tileBuilder(
          theme: TimelineThemeData(
            direction: Axis.horizontal,
            nodePosition: 0,
            connectorTheme: const ConnectorThemeData(
              thickness: 5.0,
              color: Color(0xFFE0E0E0),
            ),
          ),
          builder: TimelineTileBuilder.connected(
            oppositeContentsBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  controller.checkpoints[index]['status'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },

            
        
            connectionDirection: ConnectionDirection.before,
            itemCount: 3,
            contentsBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  controller.checkpoints[index]['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                
                ),
              );
            },
            indicatorBuilder: (context, index) {
              var color;
              var child;
              if (controller.checkpoints[index]['status'] == 'completed') {
                color = Colors.green;
                child = Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15.0,
                );
              } else {
                color = Theme.of(context).disabledColor;
              }

              if (index <= controller.current_checkpoint.value) {
                return Stack(
                  children: [
                    CustomPaint(
                      size: Size(30.0, 30.0),
                      painter: _BezierPainter(
                        color: color,
                        drawStart: index > 0,
                        drawEnd: index < controller.checkpoints.length - 1,
                      ),
                    ),
                    DotIndicator(
                      size: 30.0,
                      color: color,
                      child: child,
                    ),
                  ],
                );
              }else{
                return Stack(
                  children: [
                    CustomPaint(
                      size: Size(30.0, 30.0),
                      painter: _BezierPainter(
                        color: color,
                        drawStart: index > 0,
                        drawEnd: index < controller.checkpoints.length - 1,
                      ),
                    ),
                    OutlinedDotIndicator(
                      borderWidth: 4.0,
                      color: color,
                    ),
                  ],
                );
              }
            },
            connectorBuilder: (_, index, type) {
              if (index > 0) {
                return SolidLineConnector(
                  color: Color(0xFFE0E0E0),
                );
              } else {
                return null;
              }
            },
          ),
        
        ),
        )
        ,
        Expanded(child: 
        IndexedStack(
          index:controller.current_checkpoint.value,
          children: [
            PrePlantingView(),
            PlantingView(),
            SaleView()
          ],
        ))
        ],
      )
    );
  }
}
