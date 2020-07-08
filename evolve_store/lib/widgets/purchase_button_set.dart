import 'package:evolvestore/widgets/custom_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PurchaseButtonSet extends StatefulWidget {
  const PurchaseButtonSet({
    Key key,
  }) : super(key: key);

  @override
  _PurchaseButtonSetState createState() => _PurchaseButtonSetState();
}

class _PurchaseButtonSetState extends State<PurchaseButtonSet> {
  int productCount = 0;

  void increase() {
    setState(() {
      productCount++;
    });
  }

  void decrease() {
    setState(() {
      if (productCount <= 0) {
        return;
      }
      productCount--;
    });
  }

  _launchURL() async {
    const url = 'https://www.evolvebranding.ca';
    if (await canLaunch(url)) {
      await launch(url);
      print(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: CustomNeumorphic(
              width: 40,
              height: 40,
              child: Icon(Icons.remove, color: Colors.grey),
              depth: 7,
              negative: false,
            ),
            onTap: () {
              decrease();
            },
          ),
          Container(
              width: 40,
              height: 15,
              child: Center(
                child: Text(
                  productCount.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
          GestureDetector(
            child: CustomNeumorphic(
              width: 40,
              height: 40,
              child: Icon(
                Icons.add,
                color: Colors.grey,
              ),
            ),
            onTap: () {
              increase();
            },
          ),
          GestureDetector(
            child: CustomNeumorphic(
              width: 150,
              height: 40,
              background: Color(0xFF25d8bf),
              child: Center(
                child: Text(
                  "Buy Now  >",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            onTap: () {
              _launchURL();
            },
          ),
        ],
      ),
    );
  }
}
