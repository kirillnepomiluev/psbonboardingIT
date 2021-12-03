import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_digital_finals/course/models/course_model.dart';
import 'package:flutter_app_digital_finals/course/project/project_page.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BoxCourse extends StatelessWidget {
  final Course project;

  BoxCourse({
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProjectPage(
              course: project,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffEFF2F5),width: 1),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset('assets/imageHeaderCourse.png',fit: BoxFit.fill,),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 12,right: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.projectName,style: const TextStyle(color: blackTextPSB,fontSize: 14,fontFamily: 'Gilroy',fontWeight: FontWeight.w400),),
                    Text(project.nameSection,style: const TextStyle(color: lightBlackTextPSB,fontSize: 13,fontFamily: 'Gilroy',fontWeight: FontWeight.w400)),
                    _rowProgressAndRating()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //строчка с прогрессом и рейтингом
  Widget _rowProgressAndRating(){
    //переводим дробное в проценты
    final double percentConvert = double.tryParse(project.progress)! * 100;
    //округляем
    final String percentConvertString = percentConvert.round().toString();

    return Row(
      children: [
        Text(percentConvertString + '%',style: const TextStyle(color: lightBlackTextPSB,fontSize: 10,fontFamily: 'Gilroy',fontWeight: FontWeight.w500),),
        Expanded(child: _boxProgress()),
        const Icon(Icons.star,color: starPSB,size: 9),
      //  Text(project.ratingProject,style: const TextStyle(color: lightBlackTextPSB,fontSize: 10,fontFamily: 'Gilroy',fontWeight: FontWeight.w500),)
      ],
    );
  }

  //плашка с заполнением цветом контейнера показывающая прогресс
  Widget _boxProgress(){
    return LinearPercentIndicator(
      lineHeight: 5.0,
      percent: double.tryParse(project.progress)!,
      backgroundColor: noActiveStarPSB,
      progressColor: blueTextPSB,
    );
  }

}
