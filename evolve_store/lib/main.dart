import 'package:evolvestore/widgets/category_slide.dart';
import 'package:evolvestore/widgets/product_slide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget buildProduct() {
    return ProductSlideList();
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
//            color: Color(0xFF25d8bf),
            title: NeumorphicText(
              "Evolve Store",
              style: NeumorphicStyle(
                color: Colors.grey[900],
                boxShape: NeumorphicBoxShape.circle(),
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
//                fontFamily: 'Adamina',
              ),
            ),
            leading: NeumorphicButton(
              child: Icon(
                Icons.menu,
                color: Color(0xFF25d8bf),
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
              CategorySlideList(),
              buildProduct(),
            ],
          ),
          bottomNavigationBar: Neumorphic(
            style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                depth: 10,
//                surfaceIntensity: 1,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(50))),
            child: BottomAppBar(
//              shape: NeumorphicShape.convex,
              color: Color(0xffEFF3F6),
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NeumorphicButton(
                      child: Icon(Icons.home, color: Color(0xFF25d8bf)),
                      padding: EdgeInsets.all(16),
                      style: NeumorphicStyle(
                        intensity: 1,
                        surfaceIntensity: 0.5,
                        depth: 5,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(10)),
                        color: Colors.white,
                        lightSource: LightSource.topLeft,
                      ),
                      onPressed: () {},
                    ),
                    NeumorphicButton(
                      child: Icon(Icons.shopping_cart, color: Colors.grey[700]),
                      padding: EdgeInsets.all(16),
                      style: NeumorphicStyle(
                        color: Colors.white,
                        intensity: 0.7,
                        surfaceIntensity: 0.5,
                        shape: NeumorphicShape.flat,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
//                            builder: (context) => ImagePickerPage(),
                              ),
                        );
                      },
                    ),
                    NeumorphicButton(
                      child: Icon(Icons.person, color: Colors.grey[700]),
                      padding: EdgeInsets.all(16),
                      style: NeumorphicStyle(
                        color: Colors.white,
                        intensity: 1,
                        surfaceIntensity: 0.5,
                      ),
                      onPressed: () {
//                        FirebaseAuth.instance.signOut();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
