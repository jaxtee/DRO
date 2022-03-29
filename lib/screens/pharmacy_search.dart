import 'package:dro_health/utils/products.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class PharmacySearch extends StatefulWidget {
  const PharmacySearch({Key? key}) : super(key: key);

  @override
  State<PharmacySearch> createState() => _PharmacySearchState();
}

class _PharmacySearchState extends State<PharmacySearch> {
  TextEditingController searchController = TextEditingController();
  int cartValue = 2;
  List searchList = List.from(Products);
  bool isFavorite = true;
  List newList =[];

  void  onSearchItem(value) {
    setState(() {
      searchList = Products.where((element) => element
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())).toList();
    });
  }

  void likes() {
      if (isFavorite == true) {
      setState(() {
        isFavorite = false;
      });
    } else {
      setState(() {
        isFavorite = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.height;
    var _height = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
            height: _height * 2,
            width: _width,
              child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            height: 220,
            width: _width,
            color: const Color(0xfff2f2f2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(24, 66, 24, 21),
                  height: 171,
                  width: _width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.vertical(
                      bottom: Radius.circular(25),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/bg.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                           onPressed: () => Navigator.of(context).pop(),
                           icon: const Icon(
                              Icons.arrow_back_ios_new,
                            color: Colors.white,
                           ),
                          ),
                          const SizedBox(width: 17.71),
                          const Text(
                            'Pharmacy',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 25),
                            height: 26.40,
                            width: 29.05,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/badge_icon.png'),
                                  fit: BoxFit.contain),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 1),
                      Container(
                        height: 36,
                        width: _width * 0.6,
                        margin: const EdgeInsets.only(bottom: 21),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white.withOpacity(0.2)),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: searchController,
                          textAlign: TextAlign.start,
                          autofocus: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          onChanged: onSearchItem,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 25),
                    const Icon(
                      Icons.location_on_outlined,
                      size: 15.18,
                    ),
                    const SizedBox(width: 6.07),
                    RichText(
                        text: const TextSpan(
                            text: 'Delivery in ',
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                          TextSpan(
                            text: 'Lagos, NG',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ])),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          searchController.text.isNotEmpty && searchList == searchList ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: searchList.length,
                gridDelegate:
                  const SliverGridDelegateWithMaxCrossAxisExtent(
                      crossAxisSpacing: 14,
                      maxCrossAxisExtent: 200, 
                      mainAxisSpacing: 28,
                      childAspectRatio: 0.66
                    ),
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 11),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xfff2f2f2)
                        )
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 4),
                            height: _height * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10.9505)
                              ),
                              image: DecorationImage(
                                image: AssetImage(searchList[index]['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 1.0, bottom: 3),
                                child: Text(searchList[index]['name'],
                                  style: const TextStyle(
                                    color: Color(0xff363636), letterSpacing: -0.02
                                  ),
                                ),
                              ),
                              Container(
                                height: _height * 0.2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(left: 1.0, bottom: 8),
                                            child: RichText(
                                              text: TextSpan(
                                                text: searchList[index]['type'].toString(),
                                                style: TextStyle(
                                                  color: const Color(0xff363636).withOpacity(0.6), 
                                                  fontSize: 12,
                                                  letterSpacing: -0.02
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: ' - ',
                                                      style: TextStyle(
                                                      color: const Color(0xff363636).withOpacity(0.6), 
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: searchList[index]['mg'].toString(),
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
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Container(
                                                  height: 18,
                                                  width: 18,
                                                  decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage('assets/naira-black.png'),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                Text(searchList[index]['price'].toString(),
                                                  style: const TextStyle(
                                                    color: Color(0xff363636), 
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: -0.02
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const SizedBox(height: 11),
                                          Container(
                                            height: 32,
                                            width: 32,
                                            color: const Color.fromRGBO(159, 93, 226, 0.1),
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                              constraints: const BoxConstraints(),
                                              onPressed: likes, 
                                              icon: isFavorite == true ?  const Icon(Icons.favorite_border_outlined)
                                              : const Icon(Icons.favorite_outlined),
                                                color: const Color(0xff9f5de2),
                                            ),
                                          )
                                        ]
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                      color: Color(0xff9f5de2),
                                      width: 1.5
                                    ),
                                  ),
                                ), 
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                                  child: Text('ADD TO CART',
                                  style: TextStyle(
                                    color: Color(0xff9f5de2),
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.02
                                  )
                                  ),
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                  ),
          )
              :  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 30),
                    height: 314,
                    width: 314,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/404_error.png'),
                        fit: BoxFit.contain
                      ),
                    ),
                  ),
                  // ignore: prefer_adjacent_string_concatenation
                  Text('No result found for ' + '"' + searchController.text + '"',
                    style: const TextStyle(
                      color: Color(0xff363636),fontSize: 20
                    ),
                  ),
                ]
              ),
            ],
          )
        )
      ),
      floatingActionButton: Badge(
        position: BadgePosition.topEnd(end: 2),
        animationDuration: const Duration(milliseconds: 300),
        animationType: BadgeAnimationType.slide,
        badgeColor: const Color(0xfff2c94c),
        badgeContent: Text(
          cartValue.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        child: Container(
          height: 43,
          width: 43,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              gradient: const LinearGradient(
                  colors: [Color(0xffFE806F), Color(0xffe5366a)]),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(254, 128, 111, 0.35),
                    blurRadius: 4,
                    offset: Offset(4, 4)),
              ]),
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 21,
          ),
        ),
      ),
    );
  }
}
