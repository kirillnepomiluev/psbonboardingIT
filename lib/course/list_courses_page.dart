import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/contacts/widgets/chat_box.dart';
import 'package:flutter_app_digital_finals/course/widgets/course_box.dart';
import 'package:flutter_app_digital_finals/my_scaffold.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:flutter_app_digital_finals/widgets/app_bottom_navigation_bar.dart';

import 'models/course_model.dart';
import 'models/project_model.dart';

class ListCoursesPage extends StatelessWidget {
  //экраны входящии в состав общего экрана
  final tapBarView = TabBarView(
    children: [
      ListAllCourse(),
      ListAllCourse(),
      ListAllCourse(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final body = DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100), child: _appbar()),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              //навигационная панель
              _tapBar(),
              //основная часть со сменяемыми экранами
              Expanded(
                child: tapBarView,
              ),
            ],
          ),
        ),
      ),
    );

    return MyScaffold(
        body: body,
        bottomNavigationActiveItem: AppBottomNavigationItem.courses);
  }

  //апп бар
  Widget _appbar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
              color: arrowRightPSB.withOpacity(0.2),
              spreadRadius: 8,
              blurRadius: 8),
        ],
      ),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Мои курсы',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w700),
              ),
              Expanded(child: Container()),
              const Icon(
                CupertinoIcons.search,
                size: 25,
              ),
              Container(
                width: 9,
              ),
              const Icon(
                Icons.filter_alt_sharp,
                size: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //навигационная панель
  Widget _tapBar() {
    return const TabBar(
      indicatorColor: orangePSB,
      unselectedLabelColor: blackTextPSB,
      labelStyle: TextStyle(
          fontSize: 15, fontFamily: 'Gilroy', fontWeight: FontWeight.w400),
      unselectedLabelStyle: TextStyle(
          fontSize: 15, fontFamily: 'Gilroy', fontWeight: FontWeight.w400),
      tabs: [
        Tab(
          text: 'Все',
        ),
        Tab(
          text: 'Мои проекты',
        ),
        Tab(
          text: 'Общие',
        ),
      ],
    );
  }
}

//класс для отображения участников моей команды
class ListAllCourse extends StatelessWidget {
  //список  курсов (база)
  final Map<String, dynamic> _course = {
    "ratingCurator": '0',
    "ratingProject": '0',
    "projectName": 'Back-проект',
    "nameSection": 'Мои проекты',
    "progress": '0.56',
    'curatorName': 'Лапенко Евгений',
    'startProject': false,
    'descriptionProject':
        'Мы познакомим Вас с Промсвязьбанком, поможем адаптироваться в коллективе, изучить работу и функционал.,Мы познакомим Вас с Промсвязьбанком, поможем адаптироваться в коллективе, изучить работу и функционал.',
    'timeProject': '4 часа',
    'listReviews': [
      {
        "imageContact": 'assets/imageMyContactPhoto.png',
        "nameContact": 'Анна Добрина',
        "positionContact": 'UX/UI designer',
        "timeLastMessage": '10:10',
        "textReview":
            'Одна из лучших особенностей архитектуры на основе компонентов заключается в том, что все можно рассматривать как компонент.',
      },
    ],
    'listSection': [
      {
        "completed": false,
        "insideSection": 'Лонгидрид',
        "nameSection": "Инстурменты",
        "numberSection": '01',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final Course course = Course.fromMap(_course);

    final webWidget = ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (ctx, item) {
          return Container(
            height: 160,
            child: BoxCourse(
              project: course,
            ),
          );
        });

    return kIsWeb
        ? webWidget
        : Container(
            margin: const EdgeInsets.only(top: 15),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 190 / 200,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: 1,
                itemBuilder: (ctx, item) {
                  return BoxCourse(
                    project: course,
                  );
                }),
          );
  }
}
