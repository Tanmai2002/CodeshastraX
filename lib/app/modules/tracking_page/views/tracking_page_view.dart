import 'package:codeshastra/app/views/views/planting_view.dart';
import 'package:codeshastra/app/views/views/pre_planting_view.dart';
import 'package:codeshastra/app/views/views/sale_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import '../controllers/tracking_page_controller.dart';

class TrackingPageView extends GetView<TrackingPageController> {
  const TrackingPageView({Key? key}) : super(key: key);

  Widget completedStatus() {
    return Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 15,
        ));
  }

  Widget pendingStatus() {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
    );
  }

  Widget currentStatus() {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Timeline.tileBuilder(
                shrinkWrap: true,
                theme: TimelineThemeData(
                  direction: Axis.horizontal,
                  nodePosition: 0,
                  connectorTheme: const ConnectorThemeData(
                    thickness: 5.0,
                    color: Color(0xFFE0E0E0),
                  ),
                ),
                builder: TimelineTileBuilder.connected(
                  indicatorBuilder: (context, index) {
                    return Obx(() {
                      if (index < controller.current_checkpoint.value) {
                        return completedStatus();
                      } else if (index == controller.current_checkpoint.value) {
                        return currentStatus();
                      } else {
                        return pendingStatus();
                      }
                    });
                  },
                  connectionDirection: ConnectionDirection.before,
                  itemCount: 3,
                  contentsBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        onTap: () {
                          controller.updateCurrentCheckpoint(index);
                        },
                        child: Text(
                          controller.checkpoints[index]['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
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
            )),
        Expanded(
            flex: 8,
            child: Obx(() => IndexedStack(
                  index: controller.current_checkpoint.value,
                  children: [PrePlantingView(), PlantingView(), SaleView()],
                )))
      ],
    ));
  }
}
