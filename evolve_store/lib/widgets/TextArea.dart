
import 'package:flutter/material.dart';

class Textarea extends StatelessWidget {
  String des;

  String title;

  Textarea({this.des, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          child: Text(title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          padding: EdgeInsets.symmetric(vertical: 17),
        ),
        Text(des)
      ],
    );
  }
}
