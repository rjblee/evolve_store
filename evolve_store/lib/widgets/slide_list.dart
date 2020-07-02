import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evolvestore/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SlideList extends StatefulWidget {
  @override
  _SlideListState createState() => _SlideListState();
}

class _SlideListState extends State<SlideList> {
  @override
  Widget build(BuildContext context) {
    List<Widget> makeProductList(AsyncSnapshot snapshot) {
      return snapshot.data.documents.map<Widget>((document) {
        return NeumorphicButton(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/backpack.png",
                  height: 150,
                ),
                SizedBox(height: 16),
                Text(
                  document["name"],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$" + document["price"].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(document["category"]),
              ],
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductPage()));
          },
        );
      }).toList();
    }

    return StreamBuilder(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            return SizedBox(
              height: 300,
              child: ListView(
                padding: EdgeInsets.all(20),
                scrollDirection: Axis.horizontal,
                children: makeProductList(snapshot),
              ),
            );
        }
      },
    );
  }
}
