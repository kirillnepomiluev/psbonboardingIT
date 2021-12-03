import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/course/models/reviews_model.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

class BoxReview extends StatelessWidget {
  final Reviews reviews;


  BoxReview({
    required this.reviews
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: lightBlackTextPSB.withOpacity(0.1),
              spreadRadius: 4,
              blurRadius: 4
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    radius: 50 / 2,
                    backgroundImage: Image.asset(reviews.imageContact).image,
                  ),
                ),
                Container(width: 12),
                Expanded(
                  child: _nameAndPosition(),
                ),
                Container(width: 10),
                Text(reviews.timeLastMessage,style: const TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Gilroy',fontSize: 10,color: lightBlackTextPSB)),
              ],
            ),
          ),
          Container(padding: const EdgeInsets.only(left: 12),child: Text(reviews.textReview,style: const TextStyle(color: blackTextPSB,fontSize: 14,fontFamily: 'Gilroy',fontWeight: FontWeight.w400),),),
        ],
      ),
    );
  }

  //центральная часть с именем и должностью
  Widget _nameAndPosition(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(reviews.nameContact,style: const TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 16,color: blackTextPSB),),
          Text(
            reviews.positionContact,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 14,color: lightBlackTextPSB),
          ),
        ],
      ),
    );
  }

}
