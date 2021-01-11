import 'package:flutter/material.dart';

Widget h1(context) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.all(10.0),
    child: Text(
      'Произвольный текст как загаловок',
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.left,
    ),
  );
}
