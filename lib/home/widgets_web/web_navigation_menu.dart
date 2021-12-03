import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

import '../../router.dart';

class WebNavigationMenu extends StatelessWidget{

  final NavigationItem? activeItem; // Nullable.

  WebNavigationMenu({
    this.activeItem
  });

  @override
  Widget build(BuildContext context) {
    bool home = activeItem == NavigationItem.home;
    bool projects = activeItem == NavigationItem.projects;
    bool courses = activeItem == NavigationItem.courses;
    bool contacts = activeItem == NavigationItem.contacts;
    bool chatBot = activeItem == NavigationItem.chatBot;
    bool base = activeItem == NavigationItem.knowledgeBase;

    return Container(
      margin: const EdgeInsets.only(left: 5,top: 5,right: 5),
      padding: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: blueTextPSB.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2
          ),
        ],
      ),
      child: Column(
          children: [
            ItemBox(activeItem: home,routeNames: RouteNames.home,),
            ItemBox(activeItem: projects,text: 'Проекты',icon: Icons.margin,routeNames: RouteNames.projectPageWeb,),
            ItemBox(activeItem: courses,text: 'Курсы',icon: Icons.sticky_note_2_outlined,),
            ItemBox(activeItem: contacts,text: 'Контакты',icon: Icons.contacts,),
            ItemBox(activeItem: chatBot,text: 'Чат бот',icon: Icons.message,),
            ItemBox(activeItem: base,text: 'База знаний',icon: Icons.book_outlined,routeNames: RouteNames.knowledgeBase,),
          ],
      ),
    );
  }
}

class WebNavigationMenuForProjectManager extends StatelessWidget{

  final NavigationItemForProjectManager? activeItem; // Nullable.

  WebNavigationMenuForProjectManager({
    this.activeItem
  });

  @override
  Widget build(BuildContext context) {
    bool home = activeItem == NavigationItemForProjectManager.home;
    bool employees = activeItem == NavigationItemForProjectManager.employees;
    bool courses = activeItem == NavigationItemForProjectManager.courses;
    bool analytics = activeItem == NavigationItemForProjectManager.analytics;
    bool projects = activeItem == NavigationItemForProjectManager.projects;
    bool tests = activeItem == NavigationItemForProjectManager.tests;
    bool base = activeItem == NavigationItemForProjectManager.knowledgeBase;

    return Container(
      margin: const EdgeInsets.only(left: 5,top: 5,right: 5),
      padding: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: blueTextPSB.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2
          ),
        ],
      ),
      child: Column(
        children: [
          ItemBox(activeItem: home,routeNames: RouteNames.home,),
          ItemBox(activeItem: employees,text: ' Сотрудники',icon: Icons.margin,routeNames: RouteNames.webEmployeesPage,),
          ItemBox(activeItem: analytics,text: 'Аналитика',icon: Icons.margin),
          ItemBox(activeItem: tests,text: 'Курсы',icon: Icons.sticky_note_2_outlined,),
          ItemBox(activeItem: courses,text: 'Контакты',icon: Icons.contacts,),
          ItemBox(activeItem: projects,text: 'Чат бот',icon: Icons.message,),
          ItemBox(activeItem: base,text: 'База знаний',icon: Icons.book_outlined,)
        ],
      ),
    );
  }
}


class ItemBox extends StatelessWidget{
  IconData? icon;
  final String text;
  final Color color;
  final bool activeItem;
  final String routeNames;

  ItemBox({
    this.icon = Icons.home,
    this.text = 'Главная',
    this.color = orangePSB,
    this.activeItem = false,
    this.routeNames = RouteNames.home,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, routeNames);
      },
      child: Container(
        decoration: BoxDecoration(
            color: activeItem ? color.withOpacity(0.2) : Colors.white,
            borderRadius: BorderRadius.circular(8)
        ),
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.fromLTRB(24,24,24,0),
        child: Row(
          children: [
            Icon(icon,color: activeItem ? color : lightBlackTextPSB),
            Container(width: 15,),
            Text(text,style: TextStyle(fontSize: 16,color: activeItem ? color : lightBlackTextPSB,fontFamily: 'Gilroy',fontWeight: FontWeight.w500),),
          ],
        ),
      ),
    );
  }

}

enum NavigationItem {
  home,
  projects,
  courses,
  contacts,
  chatBot,
  knowledgeBase
}

enum NavigationItemForProjectManager {
  home,
  employees,
  analytics,
  tests,
  courses,
  projects,
  knowledgeBase
}