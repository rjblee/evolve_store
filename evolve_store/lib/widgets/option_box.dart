import 'package:evolvestore/widgets/custom_neumorphic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class OptionBox extends StatefulWidget {
  @override
  _OptionBoxState createState() => _OptionBoxState();
}

class _OptionBoxState extends State<OptionBox> {
  bool isScroll = false;
  CustomNeumorphic neumorphicBox = CustomNeumorphic();

  @override
  Widget build(BuildContext context) {
    Widget optionBoxDetail({color: Color}) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        child: NeumorphicButton(
          padding: EdgeInsets.all(0.0),
          style: NeumorphicStyle(
            depth: 10,
            shape: NeumorphicShape.convex,
            surfaceIntensity: 0.9,
          ),
          child: Container(
            width: 25,
            height: 25,
            color: color,
          ),
          onPressed: (){

          },
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Choose the option:",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              GestureDetector(
                child: Text(
                  "See all",
                  style: TextStyle(
                    color: Colors.lightGreen,
                  ),
                ),
                onTap: () {
                  setState(() {
                    isScroll = !isScroll;
                  });
                  print(isScroll);
                },
              )
            ],
          ),
        ),
        CustomNeumorphic(
          radius: 10,
          padding: EdgeInsets.all(15),
          child:
          isScroll?
          Wrap(
            children: [
              optionBoxDetail(color: Colors.blueAccent),
              optionBoxDetail(color: Colors.greenAccent),
              optionBoxDetail(color: Colors.deepOrangeAccent),
              optionBoxDetail(color: Colors.black),
              optionBoxDetail(color: Colors.blueAccent),
              optionBoxDetail(color: Colors.greenAccent),
              optionBoxDetail(color: Colors.blueAccent),
              optionBoxDetail(color: Colors.greenAccent),
              optionBoxDetail(color: Colors.deepOrangeAccent),
              optionBoxDetail(color: Colors.black),
              optionBoxDetail(color: Colors.blueAccent),
              optionBoxDetail(color: Colors.greenAccent),
            ],
          )
              :
          Container(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                optionBoxDetail(color: Colors.blueAccent),
                optionBoxDetail(color: Colors.greenAccent),
                optionBoxDetail(color: Colors.deepOrangeAccent),
                optionBoxDetail(color: Colors.black),
                optionBoxDetail(color: Colors.blueAccent),
                optionBoxDetail(color: Colors.greenAccent),
                optionBoxDetail(color: Colors.blueAccent),
                optionBoxDetail(color: Colors.greenAccent),
                optionBoxDetail(color: Colors.deepOrangeAccent),
                optionBoxDetail(color: Colors.black),
                optionBoxDetail(color: Colors.blueAccent),
                optionBoxDetail(color: Colors.greenAccent),
              ],
            ),
          ),
        )
      ],
    );
  }
}
