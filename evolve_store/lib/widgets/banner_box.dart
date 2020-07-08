import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class BannerBox extends StatelessWidget {
  List<Color> gradation;
  String text;

  BannerBox({this.gradation:const [Colors.greenAccent, Colors.green], this.text,});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Neumorphic(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

        style: NeumorphicStyle(
          depth: 5,
        ),
        child: Container(
          height: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: gradation,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
