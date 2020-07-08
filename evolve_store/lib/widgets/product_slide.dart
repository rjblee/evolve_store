import 'package:evolvestore/screens/product_detail.dart';
import 'package:evolvestore/widgets/custom_neumorphic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProductList extends StatelessWidget {
  List selectedCategoryItems;

  ProductList({this.selectedCategoryItems});

  Widget makeProductList(productItem, context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      child: CustomNeumorphic(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 15,
          ),
          child: Column(
            children: [
              Image.network(
                productItem["image"],
                height: size.height * 0.3,
                width: size.width * 0.68,
              ),
              SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productItem["name"],
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\$" + productItem["price"].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),

//              Text(productItem["category"]),
                  Neumorphic(
                    margin: EdgeInsets.only(left: 25),
                    padding: EdgeInsets.all(5),
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
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(productDetail: productItem),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.6,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: selectedCategoryItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
            child: makeProductList(selectedCategoryItems[index], context),
          );
        },
      ),
    );
  }
}
