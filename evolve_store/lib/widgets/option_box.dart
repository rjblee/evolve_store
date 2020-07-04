
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class OptionBox extends StatefulWidget {
  @override
  _OptionBoxState createState() => _OptionBoxState();
}

class _OptionBoxState extends State<OptionBox> {
  @override
  Widget build(BuildContext context) {
    Widget Optionbox({color: Color}) {
      return Container(
        margin: EdgeInsets.only(right: 10),
        child: Neumorphic(
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
        ),
      );
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Choose the option:", style: TextStyle(
                color: Colors.grey,
                fontSize: 16
            ),),
            Text("See all", style: TextStyle(
              color: Colors.greenAccent,
            ),)
          ],
        ),
        Neumorphic(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Optionbox(color: Colors.blueAccent),
              Optionbox(color: Colors.greenAccent),
              Optionbox(color: Colors.deepOrangeAccent),
              Optionbox(color: Colors.black),
              Optionbox(color: Colors.blueAccent),
              Optionbox(color: Colors.greenAccent),
            ],
          ),
        )
      ],
    );
  }
}
