import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_sliver/extended_sliver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/course/course_page.dart';
import 'package:flutter_app_digital_finals/course/list_courses_page.dart';
import 'package:flutter_app_digital_finals/home/web_home_page.dart';
import 'package:flutter_app_digital_finals/home/widgets/all_widgets.dart';
import 'package:flutter_app_digital_finals/home/widgets/box_task.dart';
import 'package:flutter_app_digital_finals/my_scaffold.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:flutter_app_digital_finals/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter_app_digital_finals/widgets/tap_bar_silver/top_tab_bar_silver.dart';

import '../main.dart';
import 'widgets/app_bar.dart';

//список призов(база)
List<String> prizeAssets = [
  'assets/prizeOne.png',
  'assets/prizeTwo.png',
  'assets/prizeThree.png',
  'assets/prizeFour.png',
  'assets/prizeFive.png',
];

// список задач(база)
List<Map<String, dynamic>> tasks = [
  {
    "time" : '10:00',
    "online" : false,
    "textTask" : 'Встретиться с Наставником',
    "completed" : true,
  },
  {
    "time" : '11:00',
    "online" : false,
    "textTask" : 'Сдать документы в отдел кадров',
    "completed" : false,
  },
  {
    "time" : '14:00',
    "online" : true,
    "textTask" : 'Пройти 3 урока Онбординга',
    "completed" : false,
  },
  {
    "time" : '15:00',
    "online" : true,
    "textTask" : 'Пройти тестирование',
    "completed" : false,
  },
  {
    "time" : '15:00',
    "online" : true,
    "textTask" : 'Пройти тестирование',
    "completed" : false,
  }
];

//главный экран
class HomePage extends StatelessWidget{
  //контроллер для поисковой строки
  TextEditingController searchController = TextEditingController();

  //списко курсов (база)
  List<String> courseAssets = [
    'assets/courseImageOne.png',
    'assets/courseImageOne.png',
    'assets/courseImageOne.png',
    'assets/courseImageOne.png',
  ];


  @override
  Widget build(BuildContext context) {
    final myScaffoldWeb = HomePageWeb();

    return kIsWeb ? myScaffoldWeb : MyScaffold(body: _body(context), bottomNavigationActiveItem: AppBottomNavigationItem.main);
  }

  Widget _body(BuildContext context){
    //общий скафолд
    final child = SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return _body2(context);
        },
        childCount: 1,
      );

    return CustomAppBar(sliverChildBuilderDelegate: child,controllerSearch: searchController,);
  }

  Widget _body2(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: MediaQuery.of(context).size.height * 1,
      child: Column(
        children: [
          //контенер с призами
          _boxPrizes(),
          //контейнре с курсами
          _boxCourses(context),
          // задачи,
          Expanded(child: _boxTasksToday()),
        ],
      ),
    );
  }

  //контенер с наградами
  Widget _boxPrizes (){
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 115,
      child: Column(
        children: [
          appTitle(title: 'Ваши награды'),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: prizeAssets.length,
              itemBuilder: (context, item) {
                return prize(
                  assets: prizeAssets[item]
                );
              },
            ),
          )
        ],
      ),
    );
  }

  // один приз
  Widget prize({String assets = 'assets/prizeFourLog'}){
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset(assets,fit: BoxFit.fill,));
  }

  // контерйнер с курсами
  Widget _boxCourses (BuildContext context){
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 200,
      child: Column(
        children: [
          appTitle(title: 'Ваши курсы'),
          Expanded(
            child: allCourse(context),
          )
        ],
      ),
    );
  }

  //один курс
  Widget allCourse(BuildContext context){
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListCoursesPage(),
          ),
        );
      },
      child: Container(
          width: 180,
          height: 168,
          margin: const EdgeInsets.only(right: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Image.asset('assets/courseImageOne.png',fit: BoxFit.fill,)),
    );
  }

  //контейнер с задачами на сегодня
  Widget _boxTasksToday (){
    if (FirebaseAuth.instance.currentUser == null) {
      return Container();
    } else {
      return Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            appTitle(title: 'Задачи на сегодня'),
            Expanded(
              child: StreamBuilder(
                stream: store
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid ?? "")
                    .collection("tasks").orderBy("time")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot snapData = snapshot.data;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapData.docs.length,
                      itemBuilder: (context, item) {
                        Map<String, dynamic> data =
                        snapData.docs[item].data() as Map<String, dynamic>;

                        int maxItem = snapData.docs.length;

                        final bool lastItem = item == maxItem - 1;
                        bool nextComleted = false;
                        if (!lastItem) {
                          nextComleted = (snapData.docs[item + 1].data() as Map<String, dynamic>)["completed"];
                        }
                        final bool firstItem = item == 0;

                        return BoxTask(
                          firstItem: firstItem,
                          time: (data['time'] as Timestamp).toDate(),
                          online: data["online"],
                          completed: data["completed"],
                          textTask: data["textTask"].toString(),
                          listItem: lastItem,
                          docSt: snapData.docs[item],
                          nextCompleted: nextComleted,
                          creator: data["creator"].toString(),
                          employee: data["employee"].toString(),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            )
          ],
        ),
      );
    }
  }


}

