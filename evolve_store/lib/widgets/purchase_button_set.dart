
import 'package:evolvestore/widgets/custom_neumorphic.dart';
import 'package:flutter/material.dart';

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
      if(productCount<=0) {
        return;
      }
      productCount--;
    });
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
            ),
            onTap: (){
              decrease();
            },
          ),
          Text(productCount.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
          GestureDetector(
            child: CustomNeumorphic(
              width: 40,
              height: 40,
              child: Icon(Icons.add,color: Colors.grey,),
            ),
            onTap: (){
              increase();
            },
          ),
          GestureDetector(
            child: CustomNeumorphic(
              width: 150,
              height: 40,
              child: Center(child: Text("Buy now  >", style: TextStyle(color: Colors.grey),)),
            ),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
