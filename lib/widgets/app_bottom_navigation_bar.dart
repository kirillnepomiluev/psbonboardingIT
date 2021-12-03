import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/contacts/contacts_page.dart';
import 'package:flutter_app_digital_finals/course/list_courses_page.dart';
import 'package:flutter_app_digital_finals/home/home_page.dart';
import 'package:flutter_app_digital_finals/profile/profile_page.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:get_it/get_it.dart';

import '../../router.dart';

//нижняя навигационная панель
class AppBottomNavigationBar extends StatelessWidget {
  //какой айтем активен
  final AppBottomNavigationItem activeItem; // Nullable.

  AppBottomNavigationBar({
    required this.activeItem,
  });

  static const _buttonsInOrder = [
    AppBottomNavigationItem.main,
    AppBottomNavigationItem.project,
    AppBottomNavigationItem.courses,
    AppBottomNavigationItem.contacts,
    AppBottomNavigationItem.profile,
  ];

  static const _newSize = 14.0;

  @override
  Widget build(BuildContext context) {
    var itemIndex = _buttonsInOrder.indexOf(activeItem);
    final isBottomMenuActive = (itemIndex != -1);
    if (itemIndex == -1) itemIndex = 0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        BottomNavigationBar(
            backgroundColor: backgroundColorNavigationMenu,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            selectedItemColor: isBottomMenuActive
                ? orangePSB
                : lightBlackTextPSB,
            unselectedItemColor: lightBlackTextPSB,
            currentIndex: itemIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Главная"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.help_center),
                  label: "Проект"),
              BottomNavigationBarItem(
                icon: Icon(Icons.sticky_note_2_outlined),
                label: "курсы",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.perm_contact_calendar_sharp),
                  label: "Контакты"
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled),
                  label: "Профиль"
              ),
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                  break;
                case 1:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                  break;
                case 2:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ListCoursesPage(),
                    ),
                  );
                  break;
                case 3:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContactsPage(),
                    ),
                  );
                  break;
                 case 4:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                  break;
                default:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                  break;
              }
            }),
      ],
    );
  }
}

enum AppBottomNavigationItem {
  main,
  project,
  courses,
  contacts,
  profile
}