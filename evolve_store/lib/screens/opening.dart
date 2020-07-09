import 'package:evolvestore/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Opening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              "https://media-exp1.licdn.com/dms/image/C560BAQHFG0abeBdddQ/company-logo_200_200/0?e=2159024400&v=beta&t=4ptxfrJ5ow5YC7jot-Q3ykQWeGlWLWZROgKrF8qR120"),
          GestureDetector(
            child: Neumorphic(
              style: NeumorphicStyle(
                color: Colors.white,
              ),
              margin: EdgeInsets.only(top: 100, right: 90, left: 90),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
