import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_digital_finals/course/widgets/lesson_box.dart';
import 'package:flutter_app_digital_finals/home/widgets/all_widgets.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

//экран с курсом
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

class BoxMentor extends StatelessWidget {
  //аватар ментора
  final String imageMentor;

  //имя ментора
  final String nameMentor;

  //должность ментора
  final String positionMentor;

  BoxMentor({
    required this.imageMentor,
    required this.nameMentor,
    required this.positionMentor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(bottom: 10, left: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                child: Center(
                  child: CircleAvatar(
                      radius: 30,
                      child: Image.asset(
                        imageMentor,
                        fit: BoxFit.fill,
                      )),
                )),
            Expanded(
                child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(nameMentor,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w400,
                                color: blackTextPSB)),
                        Text(positionMentor,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w400,
                                color: lightBlackTextPSB)),
                      ],
                    ))),
            Container(
                margin: const EdgeInsets.only(top: 0, right: 20, left: 20),
                child: Row(
                  children: [
                    Container(
                      height: 18,
                      width: 18,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.facebook,
                            color: facebookIconPSB,
                            size: 16,
                          )),
                    ),
                    Container(
                      height: 18,
                      width: 18,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.facebook,
                            size: 16,
                            color: instagramIconPSB,
                          )),
                    ),
                    Container(
                      height: 18,
                      width: 18,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.facebook,
                            color: googleIconPSB,
                            size: 16,
                          )),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
