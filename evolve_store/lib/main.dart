import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        onPressed: () {},
      );
    }).toList();
  }

  Widget buildProduct() {
    return StreamBuilder(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            return Neumorphic(
              child: SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: makeProductList(snapshot),
                ),
              ),
            );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      theme: NeumorphicThemeData(
//        baseColor: Color(0xFFffffff),
        baseColor: Color(0xFFf4faff),

        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      home: Neumorphic(
        child: Scaffold(
          appBar: NeumorphicAppBar(
//            color: Colors.grey[300],
            title: NeumorphicText(
              "Evolve Store",
//              textAlign: ,
              style: NeumorphicStyle(
                color: Colors.grey[900],
                boxShape: NeumorphicBoxShape.circle(),
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobster',
              ),
            ),
            leading: NeumorphicButton(
              child: Icon(
                Icons.menu,
                color: Colors.grey[700],
              ),
              style: NeumorphicStyle(
                depth: 5,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
              ),
              onPressed: () {},
            ),
          ),
          body: Column(
            children: [
              buildProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
