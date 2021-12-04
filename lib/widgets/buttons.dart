import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

//большая оранжевая кнопка
Widget bigButton({VoidCallback? onPressed, String text = 'Начать'}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: orangePSB,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Gilroy',
                fontSize: 18),
          ),
        ),
      ));
}

//большая кнопка c оранжевым бордером белая
Widget bigButtonOrangeBorder(
    {VoidCallback? onPressed, String text = 'Начать'}) {
  return Container(
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      border: Border.all(color: orangePSB, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: orangePSB,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Gilroy',
                  fontSize: 18),
            ),
          ),
        )),
  );
}
