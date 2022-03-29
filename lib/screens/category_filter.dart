import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:dro_health/screens/category.dart';
import 'package:dro_health/utils/product_category.dart';
import 'package:dro_health/utils/suggestions_list.dart';
import 'package:flutter/material.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({Key? key}) : super(key: key);

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Categories',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover, 
              ),
            ),
          ),
          actions: [
            Badge(
              position: BadgePosition.topEnd(),
              animationDuration: const Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeColor: const Color(0xfff2c94c),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 21,
              ),
            ),
            const SizedBox(width: 25),
          ]),
      body: SingleChildScrollView(
        child: Container(
          height: _height,
          width: _width,
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'CATEGORIES',
                    style: TextStyle(
                        color: Color(0xff363636),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.02),
                  ),
                  TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const ProductCategories()))),
                      style: TextButton.styleFrom(
                        primary: const Color(0xff9f5de2),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w600, letterSpacing: 0.02),
                      ),
                      child: const Text('VIEW ALL')),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 24, bottom: 30.45),
                height: 106.6,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: ProductCategoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 16.43),
                        height: 98.55,
                        width: 125.93,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.9505),
                            image: DecorationImage(
                                image: AssetImage(
                                    ProductCategoryList[index]['image'].toString()),
                                fit: BoxFit.cover),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(196, 196, 196, 0.1),
                                  blurRadius: 2,
                                  offset: Offset(2, 2)),
                            ]),
                        child: ProductCategoryList[index]['isSelected'] == true ? BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            height: 98.55,
                            width: 125.93,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xff7d9eff).withOpacity(0.6),
                                  const Color(0xff6351e9).withOpacity(0.6),
                                  const Color(0xff624fe8).withOpacity(0.6),
                                ]
                              ),
                            ),
                          child: Center(
                            child: Text(
                              ProductCategoryList[index]['name'].toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.4575,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.02),
                            ),
                          ),
                        ),
                      )
                      : Center(
                        child: Text(
                          ProductCategoryList[index]['name'].toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14.4575,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.02),
                        ),
                      ),
                    );
                  }),
              ),
              Row(
                children: const <Widget>[
                  SizedBox(width: 25,),
                  Text('SUGGESTIONS',
                    style: TextStyle(
                      color: Color(0xff363636), fontSize: 16, fontWeight: FontWeight.w600,
                      letterSpacing: 0.02,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: Suggestions.length,
                gridDelegate:
                  const SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 30,
                    maxCrossAxisExtent: 200, 
                    mainAxisSpacing: 28,
                    childAspectRatio: 0.66
                    ),
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 13),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xfff2f2f2)
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(130, 130, 130, 0.07),
                            blurRadius: 4,
                            offset: Offset(4, 4)),
                        ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 13),
                            height: _height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10.9505)
                              ),
                              image: DecorationImage(
                                image: AssetImage(Suggestions[index]['image'].toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 11.0, bottom: 2),
                                child: Text(Suggestions[index]['name'].toString(),
                                  style: const TextStyle(
                                    color: Color(0xff363636), letterSpacing: -0.02
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 11, bottom: 9),
                                child: RichText(
                                  text: TextSpan(
                                    text: Suggestions[index]['type'].toString(),
                                    style: TextStyle(
                                      color: const Color(0xff363636).withOpacity(0.6), 
                                      letterSpacing: -0.02
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' - ',
                                          style: TextStyle(
                                          color: const Color(0xff363636).withOpacity(0.6),
                                          letterSpacing: -0.02,
                                        ),
                                      ),
                                      TextSpan(
                                        text: Suggestions[index]['mg'].toString(),
                                        style: TextStyle(
                                          color: const Color(0xff363636).withOpacity(0.6), 
                                          fontSize: 12,
                                          letterSpacing: -0.02
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'mg',
                                        style: TextStyle(
                                          color: const Color(0xff363636).withOpacity(0.6), 
                                          fontSize: 12,
                                          letterSpacing: -0.02
                                        ),
                                      )
                                    ]
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(left: 11),
                                    height: 22,
                                    width: 22,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/naira-black.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Text(double.parse(Suggestions[index]['price'].toString()).toStringAsFixed(2),
                                    style: const TextStyle(
                                      color: Color(0xff363636),
                                      fontSize: 22, 
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.02
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
