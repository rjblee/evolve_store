import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evolvestore/screens/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CategorySlideList extends StatefulWidget {
  @override
  _CategorySlideListState createState() => _CategorySlideListState();
}

class _CategorySlideListState extends State<CategorySlideList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.horizontal,
        children: [
          NeumorphicButton(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "All",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF25d8bf)),
            ),
            onPressed: () {},
          ),
          NeumorphicButton(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Apparel",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          ),
          NeumorphicButton(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Electronics",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          ),
          NeumorphicButton(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Accessories",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          ),
          NeumorphicButton(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Gift Cards",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
