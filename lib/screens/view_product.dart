import 'package:badges/badges.dart';
import 'package:dro_health/utils/suggestions_list.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewProduct extends StatefulWidget {
  String pix;
  String name;
  String type;
  String mg;
  String price;
   ViewProduct(
      {Key? key, required this.pix, required this.name, required this.type, required this.mg, required this.price})
      : super(key: key);

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  int unit = 1;
  bool likes = false;

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
              'Pharmacy',
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
            padding: const EdgeInsets.all(20),
            height: _height * 2,
            width: _width,
            child: Column(
              children: <Widget>[
                Container(
                  height: _height * 0.2,
                  width: _height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(widget.pix),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                const Text(
                  'Emzor Paracetamol',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                      text: widget.type,
                      style: TextStyle(
                          color: const Color(0xffbdbdbd).withOpacity(0.6),
                          fontSize: 12,
                          letterSpacing: -0.02),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' - ',
                          style: TextStyle(
                            color: const Color(0xffbdbdbd).withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: widget.mg,
                          style: TextStyle(
                              color: const Color(0xffbdbdbd).withOpacity(0.6),
                              fontSize: 12,
                              letterSpacing: -0.02),
                        ),
                        TextSpan(
                          text: 'mg',
                          style: TextStyle(
                              color: const Color(0xffbdbdbd).withOpacity(0.6),
                              fontSize: 12,
                              letterSpacing: -0.02),
                        )
                      ]),
                ),
                const SizedBox(height: 39),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 199,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/Ellipse 98.png'),
                                  fit: BoxFit.cover
                              ) ,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text('SOLD BY',
                                style: TextStyle(
                                  color: Color(0xff8EA5BC),
                                  fontSize: 10,
                                  letterSpacing: 0.02
                                ),
                              ),
                              Text('Emzor Pharmaceuticals',
                                style: TextStyle(
                                  color: Color(0xff13447A),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ]
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 32,
                      width: 32,
                      color: const Color.fromRGBO(159, 93, 226, 0.1),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          setState(() {
                            likes != likes;
                          });
                        },
                        icon: likes == false ? const Icon(
                          Icons.favorite_border_outlined,
                        )
                        : const Icon(
                          Icons.favorite,
                        ),
                        color: const Color(0xff9f5de2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 96,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromRGBO(130, 130, 130, 0.3),
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              setState(() {
                                if (unit != 1) {
                                  unit--;
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text('$unit',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 15),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              setState(() {
                                unit++;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Text("Pack(s)",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5)    
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 14,
                          width: 14,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/naira-black.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                      ],
                    ),
                    Text(widget.price.toString(),
                      style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w700,   
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Row(
                  children: const <Widget>[
                    Text('PRODUCT DETAILS',
                      style: TextStyle(
                        color: Color(0xff8EA5BC), fontWeight: FontWeight.w700, letterSpacing: 0.04,  
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: 157,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 27.43,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/pack_size.png'),
                                fit: BoxFit.contain
                              )
                            ),
                          ),
                          const SizedBox(width: 10.57),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const Text('PACK SIZE',
                                style: TextStyle(
                                  color: Color(0xff8EA5BC), fontSize: 10,
                                  fontWeight: FontWeight.w400, letterSpacing: 0.02,  
                                ),
                              ),
                              Text('8 x 12 tablets (96)',
                                style: TextStyle(
                                  color: const Color(0xff13447A).withOpacity(0.8),
                                  fontWeight: FontWeight.w700,  
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 157,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 27.43,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/qr.png'),
                                fit: BoxFit.contain
                              )
                            ),
                          ),
                          const SizedBox(width: 10.57),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const Text('PRODUCT ID',
                                style: TextStyle(
                                  color: Color(0xff8EA5BC), fontSize: 10,
                                  fontWeight: FontWeight.w400, letterSpacing: 0.02,  
                                ),
                              ),
                              Text('PRO23648856',
                                style: TextStyle(
                                  color: const Color(0xff13447A).withOpacity(0.8),
                                  fontWeight: FontWeight.w700,  
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: 157,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 27.43,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/constituents.png'),
                                fit: BoxFit.contain
                              )
                            ),
                          ),
                          const SizedBox(width: 10.57),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const Text('CONSTITUENTS',
                                style: TextStyle(
                                  color: Color(0xff8EA5BC), fontSize: 10,
                                  fontWeight: FontWeight.w400, letterSpacing: 0.02,  
                                ),
                              ),
                              Text('Paracetamol',
                                style: TextStyle(
                                  color: const Color(0xff13447A).withOpacity(0.8),
                                  fontWeight: FontWeight.w700,  
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 157,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 27.43,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/packs.png'),
                                fit: BoxFit.contain
                              )
                            ),
                          ),
                          const SizedBox(width: 10.57),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const Text('DISPENSED IN',
                                style: TextStyle(
                                  color: Color(0xff8EA5BC), fontSize: 10,
                                  fontWeight: FontWeight.w400, letterSpacing: 0.02,  
                                ),
                              ),
                              Text('Packs',
                                style: TextStyle(
                                  color: const Color(0xff13447A).withOpacity(0.8),
                                  fontWeight: FontWeight.w700,  
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 39),
                const Text('1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5),  
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Text('Similar Products',
                      style: TextStyle(
                        color: Color.fromRGBO(54, 54, 54, 0.8),  fontSize: 18,
                        fontWeight: FontWeight.w700, letterSpacing: 0.02
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 17),
                Container(
                  height: _height * 0.3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: Suggestions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 16.43),
                        height: _height * 0.3,
                        width: 156,
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
                              height: _height * 0.18,
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
                      );
                    }
                  )
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff7A08FA), Color(0xffAD3BFC)]),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(173, 59, 252, 0.15),
                            blurRadius: 4,
                            offset: Offset(4, 4)),
                      ]
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 15,
                            color: Colors.white,
                          ),
                          Text('Add to cart ',
                            style: TextStyle(
                              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: -0.02
                            ),
                          )
                        ],
                      )
                    ),
                  )
                )
              ],
            ),
          ),
        ));
  }
}
