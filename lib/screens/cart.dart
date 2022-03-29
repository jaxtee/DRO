import 'package:dro_health/utils/cart_list.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List totalPrice = [];
  double? total;
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: const <Widget>[
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 21,
            ),
            SizedBox(width: 15.45),
            Text(
              'Cart',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 35, 24, 0),
          height: _height * 2,
          width: _width,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: CartList.length,
                    itemBuilder: (BuildContext context, int index) {
                      totalPrice.add(CartList[index]['price']);
                      var totalAmount = totalPrice.reduce((a, b) => a + b);
                      total = double.parse(totalAmount);
                      return Container(
                        padding: const EdgeInsets.only(right: 17),
                        height: _height * 0.1,
                        width: _width,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1.5,
                              color: Color(0xfff2f2f2),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: _height * 0.09,
                              width: 80,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/emzor.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(height: 4),
                                const Text(
                                  'Paracetamol',
                                  style: TextStyle(
                                      color: Color(0xff363636),
                                      fontSize: 16,
                                      letterSpacing: -0.02),
                                ),
                                const SizedBox(height: 7),
                                RichText(
                                  text: TextSpan(
                                      text: CartList[index]['type'].toString(),
                                      style: TextStyle(
                                          color: const Color(0xffbdbdbd)
                                              .withOpacity(0.6),
                                          fontSize: 12,
                                          letterSpacing: -0.02),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' - ',
                                          style: TextStyle(
                                            color: const Color(0xffbdbdbd)
                                                .withOpacity(0.6),
                                            fontSize: 12,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              CartList[index]['mg'].toString(),
                                          style: TextStyle(
                                              color: const Color(0xffbdbdbd)
                                                  .withOpacity(0.6),
                                              fontSize: 12,
                                              letterSpacing: -0.02),
                                        ),
                                        TextSpan(
                                          text: 'mg',
                                          style: TextStyle(
                                              color: const Color(0xffbdbdbd)
                                                  .withOpacity(0.6),
                                              fontSize: 12,
                                              letterSpacing: -0.02),
                                        )
                                      ]),
                                ),
                                const SizedBox(height: 9),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      height: 18,
                                      width: 18,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/naira-black.png'),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      CartList[index]['price'].toString(),
                                      style: const TextStyle(
                                          color: Color(0xff363636),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.02),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(height: 5),
                                Container(
                                  height: 31,
                                  width: 58,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          color: const Color(0xffc4c4c4),
                                          width: 1)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        value: CartList[index]['cartValue'],
                                        style: const TextStyle(
                                          color: Color(0xff363636),
                                        ),
                                        items: <int>[
                                          1,
                                          2,
                                          3,
                                          4,
                                          5,
                                        ]
                                            .map<DropdownMenuItem<int>>(
                                              (int value) =>
                                                  DropdownMenuItem<int>(
                                                      value: value,
                                                      child: Text(
                                                        value.toString(),
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xff363636),
                                                        ),
                                                      )),
                                            )
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            CartList[index]['cartValue'] =
                                                value!;
                                          });
                                        }),
                                  ),
                                ),
                                const SizedBox(height: 19),
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      onPressed: () {
                                        CartList[index].remove(index);
                                      },
                                      icon: const Icon(
                                        Icons.delete_outlined,
                                        color: Color(0xff9f5de2),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: 'Total:  ',
                              style: const TextStyle(
                                  color: Color(0xff363636),
                                  fontSize: 18,
                                  letterSpacing: -0.02),
                              children: [
                            TextSpan(
                              text: '$total',
                              style: const TextStyle(
                                  color: Color(0xff363636),
                                  fontSize: 18, fontWeight: FontWeight.w600,
                                  letterSpacing: -0.02),
                            )
                          ])),
                      Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xff7A08FA), Color(0xffAD3BFC)]),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(173, 59, 252, 0.15),
                                  blurRadius: 4,
                                  offset: Offset(4, 4)),
                            ]),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shadowColor: Colors.transparent,
                            ),
                            child: const Text(
                              'CHECKOUT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.02),
                            )),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
