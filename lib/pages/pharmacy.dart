import 'package:dro_health/screens/cart.dart';
import 'package:dro_health/screens/category.dart';
import 'package:dro_health/screens/category_filter.dart';
import 'package:dro_health/screens/pharmacy_search.dart';
import 'package:dro_health/screens/view_product.dart';
import 'package:dro_health/utils/product_category.dart';
import 'package:dro_health/utils/suggestions_list.dart';
import 'package:flutter/material.dart';

class Pharmacy extends StatefulWidget {
  const Pharmacy({Key? key}) : super(key: key);

  @override
  State<Pharmacy> createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  TextEditingController searchController = TextEditingController();
  int cartValue = 2;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'Pharmacy',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
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
                          const SizedBox(height: 18),
                          Container(
                            height: 36,
                            width: _width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white.withOpacity(0.2)),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: searchController,
                              textAlign: TextAlign.start,
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PharmacySearch())),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search_outlined,
                                  color: Colors.white,
                                ),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
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
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 16, 25, 15),
                child: Row(
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
              ),
              Container(
                margin: const EdgeInsets.only(left: 24, bottom: 30.45),
                height: 106.6,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: ProductCategoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: ((context) => const CategoryFilter()))
                        ),
                        child: Container(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Expanded(
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
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(builder: ((context) => ViewProduct(
                                  pix: Suggestions[index]['image'].toString(),
                                  mg: Suggestions[index]['mg'].toString(),
                                  name: Suggestions[index]['name'].toString(),
                                  price: Suggestions[index]['price'].toString(),
                                  type: Suggestions[index]['type'].toString(),
                                )))
                              ),
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 13),
                                height: _height * 0.16,
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
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Cart())
        ),
        child: Container(
          padding: const EdgeInsets.all(13),
          height: 43,
          width: 135,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              gradient: const LinearGradient(
                  colors: [Color(0xffFE806F), Color(0xffe5366a)]),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(254, 128, 111, 0.35),
                    blurRadius: 4,
                    offset: Offset(4, 4)),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                'Checkout',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.shopping_cart_outlined,
                  color: Colors.white, size: 16.94),
              Container(
                height: 18,
                width: 18,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xfff2c94c)),
                child: Text(
                  cartValue.toString(),
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
