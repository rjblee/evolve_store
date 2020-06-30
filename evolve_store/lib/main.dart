import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Widget> makeList(AsyncSnapshot snapshot) {
    return snapshot.data.documents.map<Widget>((document) {
      return ListTile(
        title: Text(document["name"]),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Evolve Store"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: Firestore.instance.collection('evolve_items').snapshots(),
          builder: (context, snapshot) {
//            switch (snapshot.connectionState) {
//              case ConnectionState.waiting:
//                return Center(
//                  child: CircularProgressIndicator(),
//                );
//              default:
            return ListView(
              children: [
                makeList(snapshot),
              ],
            );
//            }
//            ;
          },
        ),
      ),
    );
  }
}
