import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

class GreenOrangeHeaderWeb extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _oneBox()),
        Container(width: 20,),
        Expanded(child: _oneBox(color: greenPSB,header: 'Задачи',stat: '6 задач'))
      ],
    );
  }

  Widget _oneBox({String header = 'Онбординг', String stat = '3 сотрудника',Color color = orangePSB}){
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 22, 15, 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(header,style: const TextStyle(color: Colors.white,fontSize: 21,fontFamily: 'Gilroy',fontWeight: FontWeight.w400),),
          Text(stat,style: const TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Gilroy',fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

}