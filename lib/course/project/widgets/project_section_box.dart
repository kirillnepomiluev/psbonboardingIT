import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/course/models/section_model.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

class BoxSection extends StatelessWidget {
  final Section section;
  final bool lastItem;

  BoxSection({
    required this.section,
    required this.lastItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Row(
        children: [
          //плашка показатель прохождкния раздела
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: section.completed ? orangePSB : const Color(0xFFEBEBEB)),
                child: Center(
                    child: section.completed
                        ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 12,
                    )
                        : Container(
                      color: Colors.white,
                      height: 7,
                      width: 7,
                    )),
              ),
              lastItem
                  ? Container()
                  : Expanded(
                child: Container(
                  // height: 70,
                  width: 1,
                  color: section.completed ? orangePSB : const Color(0xFFEBEBEB),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              height: 80,
              margin: const EdgeInsets.only(bottom: 10, left: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: section.completed ? blueTextPSB : Colors.white),
                color: const Color(0xFFF9F9F9),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: Center(
                        child: Text(
                      section.numberSection,
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
                              Text(section.nameSection,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w400,
                                      color: blueTextPSB)),
                              Text(section.insideSection,
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
                            CupertinoIcons.upload_circle,
                            color: blueTextPSB,
                            size: 18,
                          )))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
