import 'package:flutter/material.dart';

class Doctors extends StatefulWidget {
  const Doctors({ Key? key }) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('DOCTORS',
          style: TextStyle(
            fontSize: 24,fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}