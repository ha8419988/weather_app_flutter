import 'package:flutter/material.dart';

const linkAsset = 'assets/images/weathers/';

class AssetCustom {
  static getLinkImg(String name) {
    return '$linkAsset${name.replaceAll(' ', '').toLowerCase()}.png';
  }
}

class MyKey {
  static const String apiKey = 'fd468ca1f12779368e286386dc3df08a';
}

Widget createTemp(num temp, {double fontSize = 100.0}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        temp.round().toString(),
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
      Text(
        '0',
        style: TextStyle(
            fontSize: fontSize / 3,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      )
    ],
  );
}
