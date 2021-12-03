import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/auth/model/psb_employee.dart';
import 'package:flutter_app_digital_finals/contacts/widgets/chat_box.dart';
import 'package:flutter_app_digital_finals/course/list_courses_page.dart';
import 'package:flutter_app_digital_finals/home/web_home_page.dart';
import 'package:flutter_app_digital_finals/home/widgets/all_widgets.dart';
import 'package:flutter_app_digital_finals/home/widgets/box_task.dart';
import 'package:flutter_app_digital_finals/home/widgets_web/web_navigation_menu.dart';
import 'package:flutter_app_digital_finals/my_scaffold.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:provider/provider.dart';

//экран с проектом принадлежащим новому сотруднику
class ProjectPageWeb extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bodyRight: _rightBody(),
      bodyCenter: _centerBody(context),
      bodyLeft: _leftBody(),
    );
  }

  Widget _leftBody(){
    return Column(
      children: [
        WebNavigationMenu(activeItem: NavigationItem.projects,),
        Container(height: 10,),
        appTitle(title: 'Команда'),
        _listContact(),
      ],
    );
  }

  Widget _rightBody(){
    return Container();
  }

  Widget _centerBody(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          _boxForHeaderAndDescription(),
          Container(height: 15,),
          _boxForHeaderAndDescription(logo: false,description: 'Сокращение срока адаптации нового сотрудника проекта с 3 месяцев до 1 месяца. ',header: 'Цель проекта'),
          Container(height: 15,),
          Image.asset('assets/imageCompulsoryActivities.png'),
          Container(height: 15,),
          Image.asset('assets/imagePlanWork.png'),
          Container(height: 15,),
          _boxForHeaderAndDescription(logo: false,description: 'Веб-приложение для сотрудников банка.',header: 'Результаты проекта'),
          Container(height: 15,),
          Image.asset('assets/imageOrganizationalStructure.png'),
          Container(height: 15,),
          Image.asset('assets/communicationMap.png'),
          Container(height: 15,),
        ],
      ),
    );
  }

  //контейнер для центральной части экрана с заголовком описанием и тегами
  Widget _boxForHeaderAndDescription({String header = 'Наименование и тип',String description = 'Разработка программного решения для онбординга новых ИТ-специалистов банка.',bool logo = true}){
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFEFF2F5),width: 1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header,style: const TextStyle(color: blackTextPSB,fontSize: 26,fontFamily: 'Gilroy',fontWeight: FontWeight.w600),),
          Container(height: 10,),
          Text(description,style: const TextStyle(color: blackTextPSB,fontSize: 16,fontFamily: 'Gilroy',fontWeight: FontWeight.w400),),
          Container(height: 10,),
          logo ? Row(children: [
            _teg('AGILE',orangePSB),
            Container(width: 7,),
            _teg('SCRUM',blueTextPSB),
           ],
          ) : Container()
        ],
      ),
    );
  }

  //виджет тег применяемый для _boxForHeaderAndDescription
  Widget _teg(String lable, Color color){
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
      child: Text(lable,style: const TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Gilroy',fontSize: 10,color: Colors.white),),
    );
  }

  //список контактов
  Widget _listContact(){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: chat.length,
        itemBuilder: (ctx, item){
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
  // Widget _boxTasksToday (){
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 15),
  //     child: Column(
  //       children: [
  //         appTitle(title: 'Задачи на сегодня'),
  //         ListView.builder(
  //           physics: const NeverScrollableScrollPhysics(),
  //           shrinkWrap: true,
  //           itemCount: tasks.length,
  //           itemBuilder: (context, item) {
  //             int maxItem = tasks.length;
  //
  //             final bool lastItem = item == maxItem - 1;
  //             final bool firstItem = item == 0;
  //
  //             return BoxTask(
  //               firstItem: firstItem,
  //               time: tasks[item]["time"],
  //               online: tasks[item]["online"],
  //               completed: tasks[item]["completed"],
  //               textTask: tasks[item]["textTask"],
  //               listItem: lastItem,
  //             );
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }

}