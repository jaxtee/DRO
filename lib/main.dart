import 'package:dro_health/pages/community.dart';
import 'package:dro_health/pages/doctors.dart';
import 'package:dro_health/pages/home.dart';
import 'package:dro_health/pages/pharmacy.dart';
import 'package:dro_health/pages/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DROHealth());
}

class DROHealth extends StatelessWidget {
  const DROHealth({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavControl(),
    );
  }
}

class BottomNavControl extends StatefulWidget {
  const BottomNavControl({Key? key}) : super(key: key);

  @override
  _BottomNavControlState createState() => _BottomNavControlState();
}

class _BottomNavControlState extends State<BottomNavControl> {
  EdgeInsets padding = const EdgeInsets.all(12);
  int _selectedItemPosition = 2;
  Color selectedColor = const Color(0xff9f5de2);
  Color unselectedColor = const Color(0xff828282);

  void _onTabPressed(int index) {
    setState(() {
      _selectedItemPosition = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffeeebf1),
        elevation: 0,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedItemPosition,
        onTap: _onTabPressed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_outlined),
            label: 'Pharmacy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum_outlined),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedItemPosition,
        children: const [Home(), Doctors(), Pharmacy(), Community(), Profile()],
      ),
    );
  }
}
