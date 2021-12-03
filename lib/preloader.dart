import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Preloader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            child: Image.asset('assets/logoPSB.png'),
            height: 60,
            width: 200,
          ),
        ),
      ),
    );
  }

}