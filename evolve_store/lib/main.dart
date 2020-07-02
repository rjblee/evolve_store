import 'package:evolvestore/widgets/slide_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget buildProduct() {
    return SlideList();
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      theme: NeumorphicThemeData(
//        baseColor: Color(0xFFffffff),
        baseColor: Color(0xFFf4faff),

        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      home: Neumorphic(
        child: Scaffold(
          appBar: NeumorphicAppBar(
//            color: Colors.grey[300],
            title: NeumorphicText(
              "Evolve Store",
//              textAlign: ,
              style: NeumorphicStyle(
                color: Colors.grey[900],
                boxShape: NeumorphicBoxShape.circle(),
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobster',
              ),
            ),
            leading: NeumorphicButton(
              child: Icon(
                Icons.menu,
                color: Colors.grey[700],
              ),
              style: NeumorphicStyle(
                depth: 5,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
              ),
              onPressed: () {},
            ),
          ),
          body: Column(
            children: [
              buildProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
