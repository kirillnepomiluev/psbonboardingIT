import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/course/models/course_model.dart';
import 'package:flutter_app_digital_finals/course/models/project_model.dart';
import 'package:flutter_app_digital_finals/course/project/project_discussions_page.dart';
import 'package:flutter_app_digital_finals/course/project/project_section_page.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

import '../list_courses_page.dart';

//экран с проектом
class ProjectPage extends StatelessWidget {
  final Course course;

  ProjectPage({
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Expanded(child: _body())
        ],
      ),
    );
  }

  Widget _body() {
    //сменяемые свайпом(вправо/влево экраны) каждый children = экран
    final tapBarView = TabBarView(
      children: [
        ProjectSectionPage(
          sections: course.listSection,
        ),
        ProjectDiscussionsPage(
          reviews: course.listReviews,
        ),
        Container(),
      ],
    );

    //все кроме верхнего имаджа
    final body = DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 10,
          ),
          Text(
            course.nameSection,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: blackTextPSB,
                fontFamily: 'Gilroy',
                fontSize: 24),
          ),
          _stringCurator(),
          _tapBar(),
          Expanded(child: tapBarView),
        ],
      ),
    );

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
      child: body,
    );
  }

  //навигационная панель
  Widget _tapBar() {
    return const TabBar(
      indicatorColor: orangePSB,
      unselectedLabelColor: blackTextPSB,
      labelStyle: TextStyle(
          fontSize: 15, fontFamily: 'Gilroy', fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(
          fontSize: 15, fontFamily: 'Gilroy', fontWeight: FontWeight.w500),
      tabs: [
        Tab(
          text: 'Разделы',
        ),
        Tab(
          text: 'Обсуждения',
        ),
        Tab(
          text: 'Тесты',
        ),
      ],
    );
  }

  // строчка с куратором
  Widget _stringCurator() {
    return Container(
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
              child: Text(course.curatorName),
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
          const Icon(CupertinoIcons.book, size: 16, color: blueTextPSB),
          Container(
            width: 7,
          ),
          Text(course.listSection.length.toString() + ' Разделов',
              style: const TextStyle(
                  color: blackTextPSB,
                  fontSize: 14,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
