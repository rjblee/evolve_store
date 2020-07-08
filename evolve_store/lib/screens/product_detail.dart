import 'package:evolvestore/widgets/circle_product_image.dart';
import 'package:evolvestore/widgets/custom_neumorphic.dart';
import 'package:evolvestore/widgets/option_box.dart';
import 'package:evolvestore/widgets/TextArea.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProductPage extends StatelessWidget {
  Map<dynamic, dynamic> productDetail;
  ProductPage({this.productDetail});

  String productDes;
//  productDetail

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    String name = productDetail['name'];
    String category = productDetail['category'];
    String description = productDetail['description'];
    String image = productDetail['image'];
    int price = productDetail['price'];

    name = name != null ? name : "Name";
    price = price != null ? price : 0;
    category = category != null ? category : "Category";
    description = description != null ? description : "Description";
    image = image != null ? image : "";

    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xffEFF3F6),
          child: Stack(
            children: [
              CircleProductImage(imageURL: image),
              Column(
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.48,
                  ),
                  SizedBox(
                    height: size.height - (size.height * 0.48) - 60,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.vertical,
                      children: [
                        OptionBox(),
                        Textarea(title: name, des: description),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: PurchaseButtonSet(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
