import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_work/logic/controller.dart';
import 'package:test_work/widgets/addItem.dart';
import 'package:test_work/widgets/info.dart';
import 'package:test_work/widgets/widgets.dart';

class CardPage extends StatelessWidget {
  final AppController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
          title: Text(
            'Корзина',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: AspectRatio(
                        aspectRatio: 4.0 / 3.0,
                        child: CachedNetworkImage(
                            imageUrl: controller.imageUrl.value,
                            fit: BoxFit.fitWidth,
                            placeholder: (context, url) => Container(
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error)),
                      ),
                    ),
                    h1(context),
                    SizedBox(
                      height: 10.0,
                    ),
                    AddItem(),
                  ],
                ),
              ),
            ),
            InfoWidget()
          ],
        ));
  }
}
