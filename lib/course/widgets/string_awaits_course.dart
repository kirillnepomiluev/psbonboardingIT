import 'package:flutter/cupertino.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

class StringAwaitsCourse extends StatelessWidget {
  //иконка
  final Icon icon;
  //описание
  final String text;

  StringAwaitsCourse({
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Container(width: 7,),
        Text(text, style: const TextStyle(
            color: blackTextPSB,
            fontSize: 14,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400)),
      ],
    );
  }

}