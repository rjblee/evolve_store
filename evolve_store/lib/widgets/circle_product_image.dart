import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CircleProductImage extends StatelessWidget {
  String imageURL;
  CircleProductImage({this.imageURL});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      top: -(size.height * 0.3),
      left: -(size.width * 0.21),
      child: Neumorphic(
        padding: EdgeInsets.only(
          top: size.height * 0.4,
          left: size.width * 0.35,
          right: size.width * 0.35,
          bottom: 0,
        ),
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(),
          depth: -10,
          intensity: 0.8,
          surfaceIntensity: 0.5,
          shape: NeumorphicShape.flat,
//          color: Color(0xffe3edf4),
        lightSource: LightSource.bottom,
          color: Color(0xffe3ecf3),
        ),
        child: Container(
          padding: EdgeInsets.only(bottom: size.height * 0.07),
//          margin: EdgeInsets.only(bottom: 30),
          width: size.width * 0.7,
          height: size.height * 0.4,
          color: Colors.transparent,
          child: Image.network(
            imageURL,
            height: 150,
            width: 150,
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
