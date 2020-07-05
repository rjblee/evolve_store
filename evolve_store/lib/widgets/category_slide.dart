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

    Widget categoryItem({categoryName: String, active : false}) {
      bool isActive = active ? active: false;
      return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              color: Color(0XFFEFF3F6),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    offset: Offset(6, 2),
                    blurRadius: 6.0,
                    spreadRadius: 3.0),
                BoxShadow(
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                    offset: Offset(-6, -2),
                    blurRadius: 6.0,
                    spreadRadius: 3.0)
              ]),
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Text(
            categoryName,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: isActive? Color(0xFF25d8bf) : Colors.grey),
          ),
        ),
        onTap: () {
          print(categoryName);
        },
      );
    }


    return SizedBox(
      height: 80,
      child: ListView(
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.horizontal,
        children: [
          categoryItem(categoryName: "All", active: true),
          categoryItem(categoryName: "Apparel"),
          categoryItem(categoryName: "Electronics"),
          categoryItem(categoryName: "Accessories"),
          categoryItem(categoryName: "Gift Cards"),
        ],
      ),
    );
  }
}
