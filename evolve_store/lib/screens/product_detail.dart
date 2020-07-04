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
        body: Container(
          color: Color(0xffEFF3F6),
          child: Stack(
            children: [
              CircleProductImage(),
              Column(
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height*0.48,
                  ),
                  SizedBox(
                    height: size.height-(size.height*0.48),
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
      ),
    );
  }
}
