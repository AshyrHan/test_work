import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_work/logic/controller.dart';

class Home extends StatelessWidget {
  final TextEditingController urlController = TextEditingController();
  final TextEditingController countController = TextEditingController();
  final AppController controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: Get.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textfield('Введите URL', urlController),
                SizedBox(
                  height: 15.0,
                ),
                textfield('Количество от 3 до 5', countController),
                SizedBox(
                  height: 15.0,
                ),
                FlatButton(
                  onPressed: () {
                    controller.homeSubmit(
                        urlController.text, countController.text);
                    //Get.to(CardPage());
                  },
                  textColor: Colors.white,
                  child: Text('Далее'),
                  color: Theme.of(context).accentColor,
                )
              ],
            )),
      ),
    );
  }
}

// поле ввода
Widget textfield(String hint, controller) {
  return TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      hintText: hint,
    ),
    controller: controller,
  );
}
