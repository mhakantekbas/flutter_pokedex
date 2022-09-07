import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._(); // constructor ı gizli belirledik ki kimse buradan nesne üretemesin

  static const String title = 'Pokedex';
  static TextStyle getTitleTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calclateFontSize(48));
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calclateFontSize(22));
  }

  static TextStyle getTypeChipTextStyle() {
    return TextStyle(color: Colors.white, fontSize: _calclateFontSize(20));
  }

  static _calclateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size
          .sp; // telefon içerisinde fontsize ı büyük yaptığında fontu da onunla beraber büyütür
    } else {
      return (size * 0.75).sp;
    }
  }
}
