import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_work/logic/controller.dart';

class InfoWidget extends StatelessWidget {
  final AppController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height * 0.06,
        width: double.infinity,
        decoration: DottedDecoration(
            color: Colors.blueGrey,
            shape: Shape.line,
            dash: [2, 5],
            linePosition: LinePosition.top),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.center,
            color: Colors.blueGrey.withAlpha(80),
            child: Container(
              decoration: DottedDecoration(
                  shape: Shape.line,
                  dash: [2, 5],
                  linePosition: LinePosition.bottom),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Допольнительно',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        Text(
                          '${controller.sumCount}',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontSize: 16,
                              ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${controller.sumTotalPrice}р.',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontSize: 16,
                              ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
