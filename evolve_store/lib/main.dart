import 'package:evolvestore/screens/product_detail.dart';
import 'package:evolvestore/widgets/category_slide.dart';
import 'package:evolvestore/widgets/product_slide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var productList;
  List selectedCategoryItems = [];
  int selectedCategoryIndex = 0;
  List categoryList = [
    {'categoryName': 'All', 'categoryType': 'all'},
    {'categoryName': 'Apparel', 'categoryType': 'apparel'},
    {'categoryName': 'Electronics', 'categoryType': 'electronics'},
    {'categoryName': 'Accessories', 'categoryType': 'accessories'},
    {'categoryName': 'Gift Cards', 'categoryType': 'giftcard'},
  ];

  @override
  initState() {
    getCategory();
  }

  void getCategory() {
    var firestoreInstance = Firestore.instance;
    firestoreInstance
        .collection("products")
        .getDocuments()
        .then((querySnapshot) {
      var list = [];
      querySnapshot.documents.forEach((result) {
        list.add(result.data);
      });

      setState(() {
        productList = list;
        selectedCategoryItems = list;
      });
    });
  }

  void filterByCategory(String categoryType) {
    var filteredList = [];
    productList.forEach((item) => {
          if (item["category"] == categoryType) {filteredList.add(item)}
        });

    setState(() {
      selectedCategoryItems = filteredList;
    });
  }

  Widget makeProductList(productItem, context) {
    return NeumorphicButton(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 0,
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/backpack.png",
              height: 260,
            ),
            SizedBox(height: 14),
            Text(
              productItem["name"],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              "\$" + productItem["price"].toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(productItem["category"]),
            Neumorphic(
              padding: EdgeInsets.all(3),
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
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductPage()));
      },
    );
  }

  Widget categoryItem({categoryName: String, active: false, categoryType: String, itemIndex: int}) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: Color(0XFFEFF3F6),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(6, 2),
                  blurRadius: 6.0,
                  spreadRadius: 3.0),
              BoxShadow(
                  color: Color.fromRGBO(255, 255, 255, 0.9),
                  offset: Offset(-6, -2),
                  blurRadius: 6.0,
                  spreadRadius: 3.0)
            ]),
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          categoryName,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selectedCategoryIndex == itemIndex ? Color(0xFF25d8bf) : Colors.grey),
        ),
      ),
      onTap: () {
        if(itemIndex == 0) {
          setState(() {
            selectedCategoryItems = productList;
          });
        }else {
          filterByCategory(categoryType);
        }
        setState(() {
          selectedCategoryIndex = itemIndex;
        });
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
//            color: Color(0xFF25d8bf),
            title: NeumorphicText(
              "Evolve Store",
              style: NeumorphicStyle(
                color: Colors.grey[900],
                boxShape: NeumorphicBoxShape.circle(),
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
//                fontFamily: 'Adamina',
              ),
            ),
            leading: NeumorphicButton(
              child: Icon(
                Icons.menu,
                color: Color(0xFF25d8bf),
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
              Container(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: categoryItem(
                        categoryName: categoryList[index]['categoryName'],
                        categoryType: categoryList[index]['categoryType'],
                        itemIndex: index,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedCategoryItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        child: makeProductList(selectedCategoryItems[index], context),
                    );
                  },
                ),
              )
            ],
          ),
          bottomNavigationBar: Neumorphic(
            style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                depth: 10,
//                surfaceIntensity: 1,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(50))),
            child: BottomAppBar(
//              shape: NeumorphicShape.convex,
              color: Color(0xffEFF3F6),
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NeumorphicButton(
                      child: Icon(Icons.home, color: Color(0xFF25d8bf)),
                      padding: EdgeInsets.all(16),
                      style: NeumorphicStyle(
                        intensity: 1,
                        surfaceIntensity: 0.5,
                        depth: 5,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(10)),
                        color: Colors.white,
                        lightSource: LightSource.topLeft,
                      ),
                      onPressed: () {},
                    ),
                    NeumorphicButton(
                      child: Icon(Icons.shopping_cart, color: Colors.grey[700]),
                      padding: EdgeInsets.all(16),
                      style: NeumorphicStyle(
                        color: Colors.white,
                        intensity: 0.7,
                        surfaceIntensity: 0.5,
                        shape: NeumorphicShape.flat,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
//                            builder: (context) => ImagePickerPage(),
                              ),
                        );
                      },
                    ),
                    NeumorphicButton(
                      child: Icon(Icons.person, color: Colors.grey[700]),
                      padding: EdgeInsets.all(16),
                      style: NeumorphicStyle(
                        color: Colors.white,
                        intensity: 1,
                        surfaceIntensity: 0.5,
                      ),
                      onPressed: () {
//                        FirebaseAuth.instance.signOut();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
