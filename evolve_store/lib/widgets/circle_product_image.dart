import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CircleProductImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: -(size.height*0.35),
          left: -(size.width*0.11),
          child: Neumorphic(
            padding: EdgeInsets.only(top:size.height*0.4, left: size.width*0.25, right: size.width*0.25),
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.circle(),
              depth: -10,
              intensity: 0.9,
              surfaceIntensity: 0.9,
              shape: NeumorphicShape.concave,
              color: Colors.grey[200],
            ),

            child: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Container(
                width: 300,
                height: 300,
                color: Colors.transparent,
                child: Image.asset(
                  "assets/images/backpack.png",
                  height: 150,
                  width: 200,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
