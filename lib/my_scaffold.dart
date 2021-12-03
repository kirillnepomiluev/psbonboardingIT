import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/scaffold_web.dart';
import 'package:flutter_app_digital_finals/views/main_drawer.dart';
import 'package:flutter_app_digital_finals/widgets/app_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import 'auth/login_screen.dart';
import 'auth/model/psb_employee.dart';


// общий scaffold для каждого экрана приложения
class MyScaffold extends StatelessWidget {
  // центральная часть экран
  final Widget? body; // Nullable.
  // есть ли плавающая кнопка
  final Widget? floatingActionButton; // Nullable.
  //нижняя навигационная панель
  final AppBottomNavigationItem? bottomNavigationActiveItem;// Nullable


  // для веба
  //виджет отображающий левую часть страници (страница поделена на три части)
  final Widget? bodyLeft; // Nullable.
  //виджет отображающий центральную часть страници (страница поделена на три части)
  final Widget? bodyCenter; // Nullable.
  //виджет отображающий правую часть страници (страница поделена на три части)
  final Widget? bodyRight; // Nullable.

  MyScaffold({
    this.body,
    this.floatingActionButton,
    this.bottomNavigationActiveItem,
    this.bodyLeft,
    this.bodyCenter,
    this.bodyRight,
  });

  //макет общего экаран для app
  Widget _scaffoldApp(BuildContext context){
    return SafeArea(
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // меню выезжающее слева
        drawer: MainDrawer(),
        endDrawer: MainDrawer(),
        body: body!,
        // нижняя навигационная панель
        bottomNavigationBar: AppBottomNavigationBar(
            activeItem: bottomNavigationActiveItem!),
      ),
    );
  }

  // макет общего экаран для web
  Widget _scaffoldWeb(BuildContext context){
    return ScaffoldWeb(
      bodyLeft: bodyLeft!,
      bodyCenter: bodyCenter!,
      bodyRight: bodyRight!,
      imageContact: 'assets/imageMyContactPhoto.png',
      nameContact: 'Олег Богатов',
      positionContact: 'Full-stack Developer',
      timeLastMessage: '10:30',
    );
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<AuthModelView>(
      child:kIsWeb ? _scaffoldWeb(context) : _scaffoldApp(context) ,
      builder: (context, value, child) {
      return ((value.user == null)? LoginScreen(): child?? Container());
      },
    );
  }
}
