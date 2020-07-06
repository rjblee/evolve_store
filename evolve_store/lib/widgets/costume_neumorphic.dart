import 'package:flutter/cupertino.dart';

class CostumeNeumorphic {
  int defaultTopR = 0;
  int defaultTopG = 0;
  int defaultTopB = 0;
  double defaultTopOpacity = 0.1;
  Color defaultBottomShadowColor = Color.fromRGBO(255, 255, 255, 0.9);

  List<BoxShadow> defaultList = [
    BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    offset: Offset(6, 2),
    blurRadius: 6.0,
    spreadRadius: 3.0),
    BoxShadow(
    color: Color.fromRGBO(255, 255, 255, 0.9),
    offset: Offset(-6, -2),
    blurRadius: 6.0,
    spreadRadius: 3.0)
  ];

  List<BoxShadow> decorationNeumorphic({r: int}) {
    return [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          offset: Offset(6, 2),
          blurRadius: 6.0,
          spreadRadius: 3.0),
      BoxShadow(
          color: Color.fromRGBO(255, 255, 255, 0.9),
          offset: Offset(-6, -2),
          blurRadius: 6.0,
          spreadRadius: 3.0)
    ];;
  }

  void Onpressed() {

  }
}