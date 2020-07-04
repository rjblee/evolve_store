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
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF25d8bf)),
            ),
            onPressed: () {},
          ),
          NeumorphicButton(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Electronics",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF25d8bf)),
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

//class CategorySlideList extends StatefulWidget {
//  @override
//  _CategorySlideListState createState() => _CategorySlideListState();
//}
//
//class _CategorySlideListState extends State<CategorySlideList> {
//  @override
//  Widget build(BuildContext context) {
//    List<Widget> makeCategoryList(AsyncSnapshot snapshot) {
//      return snapshot.data.documents.map<Widget>((document) {
//        return NeumorphicButton(
//          margin: EdgeInsets.symmetric(horizontal: 20),
//          child: Container(
//            padding: EdgeInsets.symmetric(
//              horizontal: 10,
//            ),
//            child: Column(
//              children: [
//                Image.asset(
//                  "assets/images/backpack.png",
//                  height: 50,
//                ),
//                SizedBox(height: 10),
////                Text(
////                  document["name"],
////                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
////                ),
////                Text(
////                  "\$" + document["price"].toString(),
////                  style: TextStyle(fontWeight: FontWeight.bold),
////                ),
//                Text("All"),
//                Text("Apparel"),
//                Text("Electronics"),
//                Text("Gift Cards"),
//              ],
//            ),
//          ),
//          onPressed: () {
//            Navigator.push(context,
//                MaterialPageRoute(builder: (context) => ProductPage()));
//          },
//        );
//      ).toList();
//    }
//
//    return StreamBuilder(
//      stream: Firestore.instance.collection('products').snapshots(),
//      builder: (context, snapshot) {
//        switch (snapshot.connectionState) {
//          case ConnectionState.waiting:
//            return Center(
//              child: CircularProgressIndicator(),
//            );
//          default:
//            return SizedBox(
//              height: 300,
//              child: ListView(
//                padding: EdgeInsets.all(20),
//                scrollDirection: Axis.horizontal,
//                children: makeCategoryList(snapshot),
//              ),
//            );
//        }
//      },
//    );
//  }
//}
