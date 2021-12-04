import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/auth/model/psb_employee.dart';
import 'package:flutter_app_digital_finals/contacts/widgets/chat_box.dart';
import 'package:flutter_app_digital_finals/course/list_courses_page.dart';
import 'package:flutter_app_digital_finals/home/widgets/all_widgets.dart';
import 'package:flutter_app_digital_finals/home/widgets/box_task.dart';
import 'package:flutter_app_digital_finals/home/widgets_web/web_header_green_orange_box.dart';
import 'package:flutter_app_digital_finals/home/widgets_web/web_navigation_menu.dart';
import 'package:flutter_app_digital_finals/my_scaffold.dart';
import 'package:flutter_app_digital_finals/profile/widgets/prize_widget_web.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'home_page.dart';

//список чатов (база)
List<Map<String, dynamic>> chat = [
  {
    "imageContact": 'assets/imageMyContactPhoto.png',
    "nameContact": 'Анна Добрина',
    "positionContact": 'UX/UI designer',
    "timeLastMessage": '10:30',
  },
  {
    "imageContact": 'assets/mentor1.png',
    "nameContact": 'Петр Михайлов',
    "positionContact": 'Node.Js Developer',
    "timeLastMessage": '11:30',
  },
];

class HomePageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PsbEmployee user =
        Provider.of<PsbEmployeeModelView>(context, listen: true).psbEmployee;

    final bool isLead = user.group == 'LEAD';

    return MyScaffold(
      centerAppBar: true,
      bodyRight: _rightBody(islead: isLead),
      bodyCenter: _centerBody(context, user, isLead: isLead),
      bodyLeft: _leftBody(isLead),
    );
  }

  Widget _leftBody(bool isLead) {
    return Column(
      children: [
        isLead
            ? WebNavigationMenuForProjectManager(
                activeItem: NavigationItemForProjectManager.home,
              )
            : WebNavigationMenu(
                activeItem: NavigationItem.home,
              ),
        Container(
          height: 10,
        ),
        appTitle(title: 'Команда'),
        listContact(),
      ],
    );
  }

  Widget _rightBody({bool islead = false}) {
    return tasksList(islead: islead);
  }

  Widget _centerBody(BuildContext context, PsbEmployee psbEmployee,
      {bool isLead = false}) {
    return isLead
        ? SingleChildScrollView(
            child: Column(
              children: [
                //контенер с призами
                Image.asset('assets/analitics.png'),
                //контейнер с курсами/проектами
                boxCourses(context),
                //курсы
                ListAllCourse(),
              ],
            ),
          )
        : Column(
            children: [
              //контенер с призами
              PrizeWidget(psbEmployee.mark),
              //контейнер с курсами/проектами
              boxCourses(context),
              //курсы
              ListAllCourse(),
            ],
          );
  }
}

Widget tasksList({bool islead = false}) {
  if (FirebaseAuth.instance.currentUser == null) {
    return Container();
  } else {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          appTitle(title: 'Задачи на сегодня'),
          StreamBuilder(
            stream: islead
                ? store
                    .collectionGroup("tasks")
                    .where("creator",
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .orderBy("time")
                    .snapshots()
                : store
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection("tasks")
                    .orderBy("time")
                    .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
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
                    final bool firstItem = item == 0;
                    bool nextCompleted = false;
                    if (!lastItem) {
                      nextCompleted = (snapData.docs[item + 1].data()
                          as Map<String, dynamic>)["completed"];
                    }

                    return BoxTask(
                      firstItem: firstItem,
                      time: (data['time'] as Timestamp).toDate(),
                      online: data["online"],
                      completed: data["completed"],
                      textTask: data["textTask"].toString(),
                      listItem: lastItem,
                      docSt: snapData.docs[item],
                      nextCompleted: nextCompleted,
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
        ],
      ),
    );
  }
}

//список контактов
Widget listContact() {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: chat.length,
      itemBuilder: (ctx, item) {
        return ChatCard(
          border: true,
          imageContact: chat[item]['imageContact'],
          nameContact: chat[item]['nameContact'],
          positionContact: chat[item]['positionContact'],
          timeLastMessage: chat[item]['timeLastMessage'],
        );
      });
}

//контейнер с задачами на сегодня
Widget boxTasksToday() {
  if (FirebaseAuth.instance.currentUser == null) {
    return Container();
  } else {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          appTitle(title: 'Задачи на сегодня'),
          StreamBuilder(
            stream: store
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid ?? "")
                .collection("tasks")
                .orderBy("time")
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                    final bool firstItem = item == 0;
                    bool nextCompleted = false;
                    if (!lastItem) {
                      nextCompleted = (snapData.docs[item + 1].data()
                          as Map<String, dynamic>)["completed"];
                    }

                    return BoxTask(
                      firstItem: firstItem,
                      time: (data['time'] as Timestamp).toDate(),
                      online: data["online"],
                      completed: data["completed"],
                      textTask: data["textTask"].toString(),
                      listItem: lastItem,
                      docSt: snapData.docs[item],
                      nextCompleted: nextCompleted,
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
        ],
      ),
    );
  }
}

// контерйнер с курсами
Widget boxCourses(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    height: 200,
    child: Column(
      children: [
        appTitle(title: 'Курсы и проекты'),
        Expanded(
          child: allCourse(context),
        )
      ],
    ),
  );
}

//один курс
Widget allCourse(BuildContext context) {
  return Row(
    children: [
      //задачи по разработке
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListCoursesPage(),
            ),
          );
        },
        child: Container(
            width: 190,
            height: 210,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: orangePSB,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Задачи по разработке',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                      fontSize: 21,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Проект в Jira',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )),
      ),
      //Основная информация
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListCoursesPage(),
            ),
          );
        },
        child: Container(
            width: 190,
            height: 210,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
              color: greenPSB,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Основная информация',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                      fontSize: 21,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Проект в Сonfluense',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )),
      ),
    ],
  );
}
