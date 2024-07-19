import 'package:flutter/material.dart';

//Common
const String myTitle = "Study Phonics";
const String myFont = "sfPro";

//Main Size
const double appBarFontSize = 28;
const double appBarHeightRate = 0.15;
const double appBarMaxHeight = 90;
const double appBarImageWidthRate = 0.8;
const double appBarImageMaxWidth = 480;
const double horizontalMarginRate = 0.05;
const double verticalMarginRate = 0.05;
const double wordWidthRate = 0.425;
const double wordWideWidthRate = 0.85;
const double charSizeRate = 0.30;
const double wordSizeRate = 0.055;
const double wordSpaceRate = 0.04;
const double buttonSpaceRate = 0.02;
const double picMaxWidth = 240;
const double largeButtonWidthRate = 0.45;
const double smallButtonWidthRate = 0.2;
const double buttonIconSize = 30;
const double buttonHeight = 50;
const double buttonRadius = 30;

//List Size
const double listTopMargin = 10;
const double listCharSize = 25;
const double listMargin = 3;
const double listPadding = 3;

//Phonics
const List<String> allPhonics = [
  "a", "a'", "b", "c", "c'", "d", "e", "f", "g", "g'", "h", "i", "i'", "j", "k",
  "l", "m", "n", "o", "p", "q", "r", "s", "s'", "t", "u", "v", "w", "x", "y", "z",
  "er", "ir", "or", "ur", "ear'", "ie", "igh", "-y", "_i_e", "ou", "ow",
  "ēē", "ēā", "īē", "ey", "_e_e", "eer", "ear", "ue", "ui", "ew", "ōō", "ōū",
  "_u_e", "oo", "ai", "ay", "_a_e", "air", "ea", "au", "aw", "our", "oy",
  "oa", "ōw", "all", "ph", "ch", "sh", "th", "th'", "wh", "ck", "ng", "lly"
];
final int numberPhonics = allPhonics.length;

//Color
const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color transpColor = Colors.transparent;
const Color blueColor = Colors.lightBlue;
const Color pinkColor = Color.fromRGBO(255, 105, 180, 1); //'FF69B4'

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

//Widget
BoxShadow myShadow() => BoxShadow(
  color: Colors.grey, //色
  spreadRadius: 2,
  blurRadius: 4,
  offset: Offset(2, 2),
);
