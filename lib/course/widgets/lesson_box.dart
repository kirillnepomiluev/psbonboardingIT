import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

class BoxLesson extends StatelessWidget {
  //номер урока
  final String number;
  //название урока
  final String nameLesson;
  //продолжительность
  final String durationLesson;

  BoxLesson({
    required this.number,
    required this.nameLesson,
    required this.durationLesson,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(bottom: 10, left: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: Center(
                  child: Text(
                    number,
                    style: const TextStyle(
                        fontSize: 28,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400,
                        color: blackTextPSB),
                  )),
            ),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(nameLesson,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w400,
                                color: blueTextPSB)),
                        Text(durationLesson,
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
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.play_circle,
                      color: blueTextPSB,
                      size: 35,
                    )))
          ],
        ),
      ),
    );
  }
}
