import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Widget> makeProductList(AsyncSnapshot snapshot) {
    return snapshot.data.documents.map<Widget>((document) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Text(document["name"]),
            Text(document["price"].toString()),
            Text(document["category"]),
          ],
        ),
      );
    }).toList();
  }

  Widget buildProducts() {
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
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: makeProductList(snapshot),
              ),
            );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Evolve Store"),
        ),
        body: Column(
          children: [
            buildProducts(),
          ],
        ),
      ),
    );
  }
}
