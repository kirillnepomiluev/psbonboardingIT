import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/contacts/widgets/chat_box.dart';
import 'package:flutter_app_digital_finals/my_scaffold.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:flutter_app_digital_finals/widgets/app_bottom_navigation_bar.dart';

class ContactsPage extends StatelessWidget {
  //экраны входящии в состав общего экрана
  final tapBarView = TabBarView(
    children: [
      ListMyTeam(),
      ListMyTeam(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final body = DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80), child: _appbar()),
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
        bottomNavigationActiveItem: AppBottomNavigationItem.contacts);
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Контакты',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w700),
              ),
              Icon(
                CupertinoIcons.search,
                size: 20,
              )
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
          fontSize: 16, fontFamily: 'Gilroy', fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(
          fontSize: 16, fontFamily: 'Gilroy', fontWeight: FontWeight.w500),
      tabs: [
        Tab(
          text: 'Моя команда',
        ),
        Tab(
          text: 'Все сотрудники',
        ),
      ],
    );
  }
}

//класс для отображения участников моей команды
class ListMyTeam extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chat.length,
        itemBuilder: (ctx, item) {
          return ChatCard(
            imageContact: chat[item]['imageContact'],
            nameContact: chat[item]['nameContact'],
            positionContact: chat[item]['positionContact'],
            timeLastMessage: chat[item]['timeLastMessage'],
          );
        });
  }
}
