import 'package:flutter/material.dart';

//Main Size
const double appBarFontSize = 28;
const double mainPaddingRate = 0.05;
const double wordWidthRate = 0.425;
const double charSizeRate = 0.25;
const double wordSizeRate = 0.055;
const double wordSpaceRate = 0.08;
const double picMaxWidth = 250;
const double audioButtonWidthRate = 0.5;
const double operationButtonWidthRate = 0.12;
const double buttonIconSize = 30;
const double buttonHeight = 50;
const double buttonRadius = 50;

//List Size
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