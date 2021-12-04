import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/course/widgets/lesson_box.dart';
import 'package:flutter_app_digital_finals/course/widgets/mentors_box.dart';
import 'package:flutter_app_digital_finals/course/widgets/rating_row.dart';
import 'package:flutter_app_digital_finals/course/widgets/string_awaits_course.dart';
import 'package:flutter_app_digital_finals/course/widgets/string_faq.dart';
import 'package:flutter_app_digital_finals/home/widgets/all_widgets.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

import 'data_course.dart';

//экран с курсом
class CoursePage extends StatelessWidget {
  //название курса
  final String courseName;

  //имя куратора
  final String curatorName;

  //начат ли курс?
  final bool startCourse;

  //продолжительность курса
  final String timeCourse;

  //описание курса
  final String descriptionCourse;

  //рейтинг курса
  final String ratingCourse;

  //рейтинг куратора
  final String ratingCurator;

  CoursePage({
    required this.courseName,
    required this.curatorName,
    required this.startCourse,
    required this.timeCourse,
    required this.descriptionCourse,
    this.ratingCourse = '4.8',
    this.ratingCurator = '4.8',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //заголовок в виде image
                Container(
                  height: MediaQuery.of(context).size.height * 0.36,
                  child: Image.asset(
                    'assets/imageHeaderCourse.png',
                    fit: BoxFit.fill,
                  ),
                ),
                //основная часть
                _body()
              ],
            ),
            //оранжевая кнопочка play на стыке заголовка и основной части экрана
            Positioned(
              right: 30,
              top: MediaQuery.of(context).size.height * 0.33,
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 60,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: orangePSB,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow_outlined,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: arrowRightPSB.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 6),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 10,
          ),
          //название курса
          Text(
            courseName,
            style: const TextStyle(
                color: blackTextPSB,
                fontSize: 24,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400),
          ),
          //куратор
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                const Text('Куратор: ',
                    style: TextStyle(
                        color: lightBlackTextPSB,
                        fontSize: 14,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400)),
                TextButton(
                    child: Text(curatorName),
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            color: blackTextPSB,
                            fontSize: 14,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400))),
                Expanded(
                  child: Container(),
                ),
                const Icon(Icons.star, size: 16, color: starPSB),
                Text(ratingCurator,
                    style: const TextStyle(
                        color: blackTextPSB,
                        fontSize: 14,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          //время курса
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.play_circle_outline_rounded,
                  size: 18,
                ),
                Container(
                  width: 5,
                ),
                Text(startCourse ? 'Курс начат' : 'Курс не начат',
                    style: const TextStyle(
                        color: lightBlackTextPSB,
                        fontSize: 14,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400)),
                Container(
                  width: 25,
                ),
                const Icon(
                  Icons.access_time_rounded,
                  size: 18,
                ),
                Container(
                  width: 5,
                ),
                Text(timeCourse,
                    style: const TextStyle(
                        color: lightBlackTextPSB,
                        fontSize: 14,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          //описание курса
          ExpandableText(
            descriptionCourse,
            style: const TextStyle(
                color: lightBlackTextPSB,
                fontSize: 16,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400),
            expandText: 'Читать далее',
            collapseText: 'Свернуть',
            maxLines: 3,
            linkColor: blueTextPSB,
          ),
          //Что вас ждет на курсе
          _header('Что вас ждет на курсе'),
          //список того что ожидаем на курсе
          _listStringAwaitsCourse(),
          appTitle(title: 'Уроки'),
          //список уроков
          _listLesson(),
          _header('Наставники'),
          //список менторов
          _listMentor(),
          _header('FAQ'),
          //список FAQ
          _listFAQ(),
          _header('Рейтинг курса'),
          //
          _rowTextRating(),
          //рейтинг
          _boxRating(),
        ],
      ),
    );
  }

  //заголовок пункта
  Widget _header(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Text(
        text,
        style: const TextStyle(
            color: blackTextPSB,
            fontSize: 20,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400),
      ),
    );
  }

  //строчка с рейтингом курса
  Widget _rowTextRating() {
    return Container(
      margin: const EdgeInsets.only(bottom: 0, top: 10),
      child: Row(
        children: [
          Text(
            ratingCourse,
            style: const TextStyle(
                color: blackTextPSB,
                fontSize: 24,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w700),
          ),
          Container(
            width: 14,
          ),
          const Text(
            'оценка прошедших Онбординг',
            style: TextStyle(
                color: lightBlackTextPSB,
                fontSize: 15,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  //список FAQ
  Widget _listFAQ() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: faq.length,
        itemBuilder: (ctx, item) {
          return Column(
            children: [
              StringFAQ(
                text: faq[item]['text'],
              ),
              Container(
                height: 7,
              )
            ],
          );
        });
  }

  //список того что нас ждет на курсе
  Widget _listStringAwaitsCourse() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: awaitCourse.length,
        itemBuilder: (ctx, item) {
          return Column(
            children: [
              StringAwaitsCourse(
                icon: awaitCourse[item]['icon'],
                text: awaitCourse[item]['text'],
              ),
              Container(
                height: 7,
              )
            ],
          );
        });
  }

  //список уроков
  Widget _listLesson() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: lessons.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, item) {
          return BoxLesson(
            number: lessons[item]['number'],
            durationLesson: lessons[item]['durationLesson'],
            nameLesson: lessons[item]['nameLesson'],
          );
        });
  }

  //список менторов
  Widget _listMentor() {
    return ListView.builder(
        itemCount: mentors.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, item) {
          return BoxMentor(
            imageMentor: mentors[item]['imageMentor'],
            nameMentor: mentors[item]['nameMentor'],
            positionMentor: mentors[item]['positionMentor'],
          );
        });
  }

  //рейтинг бокс
  Widget _boxRating() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: rating.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, item) {
          return RatingRow(
            intStar: rating[item]['intStar'],
            percent: rating[item]['percent'],
          );
        });
  }
}
