import 'package:evolvestore/widgets/circle_product_image.dart';
import 'package:evolvestore/widgets/option_box.dart';
import 'package:evolvestore/widgets/TextArea.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    String testdes = "askjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksaaskjflksajfksa";


    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            CircleProductImage(),
            Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: 350,
                ),
                SizedBox(
                  height: size.height-350,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.vertical,
                    children: [
                      OptionBox(),
                      Textarea(title: "Bag", des: testdes),
                      Textarea(title: "Bag", des: testdes),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
