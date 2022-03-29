import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({ Key? key }) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('COMMUNITY',
          style: TextStyle(
            fontSize: 24,fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}