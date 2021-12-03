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
    "imageContact": 'assets/imageMyContactPhoto.png',
    "nameContact": 'Елизавета Михайлова',
    "positionContact": 'Node.Js Developer',
    "timeLastMessage": '10:30',
  },
  {
    "imageContact": 'assets/imageMyContactPhoto.png',
    "nameContact": 'Мария Павлова',
    "positionContact": 'React Developer',
    "timeLastMessage": '10:30',
  },
  {
    "imageContact": 'assets/imageMyContactPhoto.png',
    "nameContact": 'Николай Слободин',
    "positionContact": 'Николай Слободин',
    "timeLastMessage": '10:30',
  },
  {
    "imageContact": 'assets/imageMyContactPhoto.png',
    "nameContact": 'Олег Богатов',
    "positionContact": 'Full-stack Developer',
    "timeLastMessage": '10:30',
  },
];

class HomePageWeb extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    PsbEmployee user = Provider.of<PsbEmployeeModelView>(context, listen: true).psbEmployee;

    final bool isLead = user.group == 'LEAD';

    return MyScaffold(
      bodyRight: _rightBody(),
      bodyCenter: _centerBody(context, user),
      bodyLeft: _leftBody(isLead),
    );
  }

  Widget _leftBody(bool isLead) {
    return Column(
      children: [
        isLead ? WebNavigationMenuForProjectManager(activeItem: NavigationItemForProjectManager.home,) : WebNavigationMenu(
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

  Widget _rightBody() {
    return boxTasksToday();
  }

  Widget _centerBody(BuildContext context, PsbEmployee psbEmployee) {
    return Column(
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
  }
  else {
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
                      nextCompleted = (snapData.docs[item + 1].data() as Map<String, dynamic>)["completed"];
                    }

                    return BoxTask(
                      firstItem: firstItem,
                      time:  (data['time'] as Timestamp).toDate(),
                      online: data["online"],
                      completed: data["completed"],
                      textTask: data["textTask"].toString(),
                      listItem: lastItem,
                      docSt: snapData.docs[item],
                      nextCompleted: nextCompleted,
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
        appTitle(title: 'Ваши курсы'),
        Expanded(
          child: allCourse(context),
        )
      ],
    ),
  );
}


//один курс
Widget allCourse(BuildContext context) {
  return InkWell(
    onTap: () {
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
        child: Image.asset(
          'assets/courseImageOne.png',
          fit: BoxFit.fill,
        )),
  );
}





