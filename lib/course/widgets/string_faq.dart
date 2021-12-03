import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

class StringFAQ extends StatelessWidget {
  //описание
  final String text;

  StringFAQ({
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 18,color: blackTextPSB),),
        IconButton(onPressed: (){}, icon: Icon(Icons.add,color: blueTextPSB,size: 23,)),
      ],
    );
  }

}