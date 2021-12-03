
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

class PrizeCard extends StatelessWidget {
  //фото приза
  final String imagePrize;
  //название приза
  final String namePrize;
  //должность контакта
  final String textBodyPrize;

  PrizeCard({
    required this.imagePrize,
    required this.namePrize,
    required this.textBodyPrize,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: lightBlackTextPSB.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    radius: 50 / 2,
                    backgroundImage: Image.asset(imagePrize).image,
                  ),
                ),
                Container(width: 12),
                Expanded(
                  child: _nameAndPosition(),
                ),
              ],
            ),
          ),
          Container(height: 8),
        ],
      ),
    );
  }

  //центральная часть с названием приза
  Widget _nameAndPosition(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(namePrize,style: const TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 16,color: blackTextPSB),),
          Text(
            textBodyPrize,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 14,color: lightBlackTextPSB),
          ),
        ],
      ),
    );
  }

  //действие при нажатии на приз
  void _onTap(BuildContext context, String anotherUserId) {

  }

}
