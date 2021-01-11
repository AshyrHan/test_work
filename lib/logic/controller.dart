import 'package:get/get.dart';
import 'package:test_work/ui/card.dart';

class AppController extends GetxController {
  // init
  var imageUrl = ''.obs;
  var itemCount = 0.obs;
  var itemlists = itemlistsDefault.obs;

  // Functions
  // кнопка входа
  void homeSubmit(String url, String count) {
    if (url.isEmpty || count.isEmpty) {
      // если пустые
      Get.snackbar('Ошибка', 'Поля не должны быть пустыми');
    } else {
      bool _validURL = Uri.parse(url).isAbsolute;
      int _count = int.parse(count);
      if (_count > 5 || _count < 3) {
        // если не равен
        Get.snackbar('Ошибка', 'Количество должно быть от 3 до 5');
      } else {
        if (!_validURL) {
          // если не валидная ссылка
          Get.snackbar('Ошибка', 'Неправильный URL');
        } else {
          imageUrl.value = url;
          itemCount.value = _count;
          Get.to(CardPage());
        }
      }
    }
  }

  // increment
  void increment(int index) {
    if (itemlists[index].count < 20) {
      itemlists[index].count++;
      itemlists.refresh();
    } else {
      Get.snackbar('Ошибка', 'Количество должно быть от 0 до 20');
    }
  }

  // decrement
  void decrement(int index) {
    if (itemlists[index].count > 0) {
      itemlists[index].count--;
      itemlists.refresh();
    } else {
      Get.snackbar('Ошибка', 'Количество должно быть от 0 до 20');
    }
  }

  // getters

  // Всего кол-во
  int get sumCount {
    int _sum = 0;
    for (var i in itemlists) {
      _sum = _sum + i.count;
    }

    return _sum;
  }

  // Всего стоимость
  double get sumTotalPrice {
    double _total = 0.0;
    for (var i in itemlists) {
      _total += (i.count * i.price);
    }

    return _total;
  }
} //end

class ItemList {
  String name;
  double price;
  int count = 0;

  ItemList({this.name, this.price, this.count});
}

List<ItemList> itemlistsDefault = [
  ItemList(name: 'сыр', price: 15.0, count: 0),
  ItemList(name: 'бекон', price: 20.0, count: 0),
  ItemList(name: 'соус', price: 8.0, count: 0),
  ItemList(name: 'ананас', price: 10.0, count: 0),
  ItemList(name: 'томат', price: 5.0, count: 0),
];
