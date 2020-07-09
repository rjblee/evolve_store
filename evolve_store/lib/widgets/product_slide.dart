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
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            children: [
              Image.network(
                productItem["image"],
                height: size.height * 0.3,
                width: size.width * 0.6,
              ),
              SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: (size.width * 0.6) - 20,
                    child: Text(
                      productItem["name"],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: (size.width * 0.6) - 20,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: size.width * 0.3,
                          child: Text(
                            "\$" + productItem["price"].toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Neumorphic(
//                        margin: EdgeInsets.only(left: 130),
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
                  ),

//              Text(productItem["category"]),
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
      height: size.height * 0.55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: selectedCategoryItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(bottom: 25, top: 15),
            child: makeProductList(selectedCategoryItems[index], context),
          );
        },
      ),
    );
  }
}
