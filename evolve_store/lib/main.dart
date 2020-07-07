import 'package:evolvestore/screens/home.dart';
import 'package:evolvestore/screens/opening.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Opening(),
      ),
    );
  }
}
