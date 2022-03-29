import 'package:badges/badges.dart';
import 'package:dro_health/screens/category_filter.dart';
import 'package:dro_health/utils/product_category.dart';
import 'package:flutter/material.dart';

class ProductCategories extends StatefulWidget {
  const ProductCategories({Key? key}) : super(key: key);

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
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
          height: _height * 2,
          width: _width,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: ProductCategoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 26,
                  crossAxisCount: 2,
                  mainAxisSpacing: 26,
                  childAspectRatio: 1.5),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CategoryFilter())),
                  child: Container(
                    height: 110,
                    width: 170,
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
      ),
    );
  }
}
