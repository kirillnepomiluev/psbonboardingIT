import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/preloader.dart';
import 'package:flutter_app_digital_finals/profile/profile_page.dart';
import 'package:flutter_app_digital_finals/welcome/welcome_page.dart';
import 'package:flutter_app_digital_finals/widgets/knowledge_base_widget.dart';


import 'auth/login_screen.dart';
import 'contacts/contacts_page.dart';
import 'course/course_page.dart';
import 'course/web_project_page.dart';
import 'employees/web_employee_page.dart';
import 'home/home_page.dart';

//класс для разделение экранов по имени(навигация)
class RouteNames{
//загрузочнйый экран
static const splash = '/splash';
//главная
static const home = '/';
//экран редактирования профиля
static const profilePage = '/ProfilePage';
//экран добро пожаловать
static const welcomePage = '/WelcomePage';

//экран предзагрузки
static const preloader = '/Preloader';

//экран авторизации
static const loginScreen = '/LoginScreen';

//экран контактов
static const contactsPage = '/ContactsPage';

//экран проекта
static const projectPageWeb = '/ProjectPageWeb';

//экран проекта
static const webEmployeesPage = '/WebEmployeesPage';

//экран базы знаний
static const knowledgeBase = '/KnowledgeBase';

}
class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RouteNames.profilePage:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case RouteNames.welcomePage:
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case RouteNames.preloader:
        return MaterialPageRoute(builder: (_) => Preloader());
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteNames.contactsPage:
        return MaterialPageRoute(builder: (_) => ContactsPage());
      case RouteNames.projectPageWeb:
        return MaterialPageRoute(builder: (_) => ProjectPageWeb());
      case RouteNames.webEmployeesPage:
        return MaterialPageRoute(builder: (_) => WebEmployeesPage());
      case RouteNames.knowledgeBase:
        return MaterialPageRoute(builder: (_) => KnowledgeBaseWidget());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
