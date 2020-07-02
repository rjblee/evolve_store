import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Neumorphic(
              padding: EdgeInsets.all(80),
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.circle()
              ),
            )
          ],
        )
      ],
    );
  }
}
