import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RatingRow extends StatelessWidget {
  //сколько процентов проголосовало
  final String percent;
  //количество звезд
  final int intStar;

  RatingRow({
    required this.percent,
    required this.intStar,
  });

  @override
  Widget build(BuildContext context) {
    //переводим дробное в проценты
    final double percentConvert = double.tryParse(percent)! * 100;
    //округляем
    final String percentConvertString = percentConvert.round().toString();

    return Container(
      height: 30,
      child: Row(
        children: [
          Text(percentConvertString + '%',style: const TextStyle(color: blackTextPSB,fontSize: 19,fontFamily: 'Gilroy',fontWeight: FontWeight.w400),),
          Expanded(child: _rowStar(intStar)),
          _boxProgress()
        ],
      ),
    );
  }

  //плашка с 5 звездами
  Widget _rowStar(int star){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(width: 15,),
        Icon(Icons.star,size: 23,color: star > 0 ? starPSB : noActiveStarPSB),
        Icon(Icons.star,size: 23,color: star > 1 ? starPSB : noActiveStarPSB,),
        Icon(Icons.star,size: 23,color: star > 2 ? starPSB : noActiveStarPSB,),
        Icon(Icons.star,size: 23,color: star > 3 ? starPSB : noActiveStarPSB,),
        Icon(Icons.star,size: 23,color: star > 4 ? starPSB : noActiveStarPSB,)
      ],
    );
  }

  //плашка с заполнением цветом контейнера показывающая прогресс
  Widget _boxProgress(){
    return LinearPercentIndicator(
      linearStrokeCap: LinearStrokeCap.butt,
      width: 200.0,
      lineHeight: 14.0,
      percent: double.tryParse(percent)!,
      backgroundColor: noActiveStarPSB,
      progressColor: lightBlackTextPSB,
    );
  }

}
