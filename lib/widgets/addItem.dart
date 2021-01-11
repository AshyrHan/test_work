import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_work/logic/controller.dart';

class AddItem extends StatelessWidget {
  final AppController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black.withAlpha(8),
        width: Get.width * 0.9,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Допольнительно',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 16,
                        ),
                  ),
                )),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.itemCount.value,
                itemBuilder: (context, index) {
                  return Items(
                    index: index,
                  );
                }),
          ],
        ));
  }
}

class Items extends StatelessWidget {
  final int index;

  Items({Key key, this.index}) : super(key: key);
  final AppController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        child: ListTile(
            leading: Container(
                width: 40,
                height: 40,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: CachedNetworkImage(
                    imageUrl: controller.imageUrl.value,
                    fit: BoxFit.fitWidth,
                  ),
                )),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.itemlists[index].name,
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.clip,
                ),
                changeCount(context, index)
              ],
            ),
            trailing: Container(
              width: Get.width * 0.12,
              child: Text('+${controller.itemlists[index].price}р.'),
            )));
  }
}

class ItemList {
  final String name;
  final double price;

  ItemList(this.name, this.price);
}

List<ItemList> itemlists = [
  ItemList('сыр', 15.0),
  ItemList('бекон', 20.0),
  ItemList('соус', 8.0),
  ItemList('ананас', 10.0),
  ItemList('томат', 5.0),
];

// Кнопка уменьшить / добавить
Widget changeCount(context, int index) {
  final AppController controller = Get.find();
  return Container(
      width: 95,
      height: 35,
      child: Obx(
        () => Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                width: 60,
                height: 25,
                decoration: BoxDecoration(color: Colors.black.withAlpha(10)),
                child: Text(
                  controller.itemlists[index].count.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => controller.decrement(index),
                  child: buttons(Icons.remove),
                )),
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => controller.increment(index),
                  child: buttons(Icons.add),
                )),
          ],
        ),
      ));
}

Widget buttons(IconData icon) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    width: 30,
    height: 30,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(2, 2), color: Colors.black12, blurRadius: 3)
        ]),
    child: Icon(icon),
  );
}
