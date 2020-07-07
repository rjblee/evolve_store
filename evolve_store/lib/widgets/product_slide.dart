import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evolvestore/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProductSlideList extends StatefulWidget {
  @override
  _ProductSlideListState createState() => _ProductSlideListState();
}

class _ProductSlideListState extends State<ProductSlideList> {
  @override
  Widget build(BuildContext context) {
    List<Widget> makeProductList(AsyncSnapshot snapshot) {
      return snapshot.data.documents.map<Widget>((document) {
        return NeumorphicButton(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 0,
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/backpack.png",
                  height: 260,
                ),
                SizedBox(height: 14),
                Text(
                  document["name"],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "\$" + document["price"].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(document["category"]),
                Neumorphic(
                  padding: EdgeInsets.all(3),
                  style: NeumorphicStyle(
                    color: Color(0xFF25d8bf),
                    shape: NeumorphicShape.flat,
                    depth: -10,
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
//          onPressed: () {
//            Navigator.push(context,
//                MaterialPageRoute(builder: (context) => ProductPage()));
//          },
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
              height: 400,
              child: ListView(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                children: makeProductList(snapshot),
              ),
            );
        }
      },
    );
  }
}
