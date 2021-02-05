import 'package:deliveryapp/Models/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int currentPage;
  int selectedCategory;
  int isWishListSelected;
  bool isSelected;
  List<int> categoryWishContainer = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = 0;
    isSelected = false;
    selectedCategory = 0;
    isWishListSelected = 0;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    categoryWishContainer.clear();
    print("Dispose");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: HexColor("#F1F1F1"),
          child: Column(
            children: [
              buildTopMenuRow(),
              buildOfferColumn(context),
              buildCategoryHeading(),
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Fruits",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: 11,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.2, crossAxisCount: 1),
                          itemBuilder: (context, index) {
                            return Hero(
                              tag: "Fruits",
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))),
                                  child: Stack(children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          icon: categoryWishContainer
                                                  .contains(index)
                                              ? Icon(CupertinoIcons.heart_solid,
                                                  color: Colors.red)
                                              : Icon(
                                                  CupertinoIcons.heart,
                                                  color: Colors.red,
                                                ),
                                          onPressed: () {
                                            print("Add_Wishlist $index");
                                            setState(() {
                                              isWishListSelected = index;
                                              isSelected = isSelected;
                                              if (!categoryWishContainer
                                                  .contains(index)) {
                                                categoryWishContainer
                                                    .add(index);
                                                isSelected = true;
                                              } else {
                                                print(categoryWishContainer
                                                    .length);
                                                categoryWishContainer
                                                    .remove(index);
                                              }
                                            });
                                          }),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "images/svg/offer.svg",
                                            height: 80,
                                            alignment: Alignment.center,
                                          ),
                                          Container(
                                            height: 20,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Text(
                                              "500 g",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Text(
                                            "Fruit Title $index",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "35\$",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                print("Add to cart");
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.shopping_bag,
                                                    color: Colors.greenAccent,
                                                  ),
                                                  Text(
                                                    "Add to cart",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.green[800],
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Padding buildCategoryHeading() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black54),
              ),
              TextButton(
                  onPressed: () {
                    print("TextButton");
                  },
                  child: Text(
                    "SEEALL",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black54),
                  ))
            ],
          ),
          buildCategoryContainer()
        ],
      ),
    );
  }

  Container buildCategoryContainer() {
    return Container(
      height: 180,
      child: ListView.builder(
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print(categoryList[index]);
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                    child: Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                          color: HexColor(categoryList[index].color),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(categoryList[index].thumbnailURL,
                                height: 80, fit: BoxFit.fill),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            categoryList[index].name,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 5,
                  width: 80,
                  decoration: BoxDecoration(
                      color: selectedCategory == index
                          ? Colors.deepOrangeAccent
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                )
              ],
            );
          }),
    );
  }

  Column buildOfferColumn(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return buildOfferContainer(context);
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < 3; i++) buildPageIndicator(currentPage, i),
          ],
        )
      ],
    );
  }

  Padding buildPageIndicator(int currentPage, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 7,
        width: currentPage == index ? 30 : 10,
        decoration: BoxDecoration(
            color: Colors.green[800], borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Padding buildOfferContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "10% Discount on \nAll Organic Fresh \nVegetables",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  FlatButton(
                    color: Colors.deepOrange,
                    textColor: Colors.white,
                    disabledColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {},
                    child: Text(
                      "Check Now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Expanded(
                child: ClipRRect(
                  child: Image.asset(
                    "images/categoryThumbnail/offer.png",
                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.centerRight,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTopMenuRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset(
            "images/icons/Menu.png",
            color: Colors.black,
            height: 20,
          ),
        ),
        //IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        Row(
          children: [
            IconButton(icon: Icon(Icons.search_outlined), onPressed: () {}),
            IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () {})
          ],
        )
      ],
    );
  }
}
