import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/auth/model/psb_employee.dart';
import 'package:flutter_app_digital_finals/employees/web_employee_one_page.dart';
import 'package:flutter_app_digital_finals/home/widgets/all_widgets.dart';
import 'package:flutter_app_digital_finals/home/widgets_web/web_header_green_orange_box.dart';
import 'package:flutter_app_digital_finals/home/widgets_web/web_navigation_menu.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../main.dart';
import '../my_scaffold.dart';

class WebEmployeesPage extends StatefulWidget {

  @override
  WebEmployeesPageState createState() => WebEmployeesPageState();

}

class WebEmployeesPageState extends State<WebEmployeesPage>{

  List<PsbEmployee> _emps = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bodyRight: _rightBody(),
      bodyCenter: _centerBody(context),
      bodyLeft: _leftBody(),
    );
  }

  Widget _leftBody() {
    return Column(
      children: [
        WebNavigationMenuForProjectManager(activeItem: NavigationItemForProjectManager.employees,),
        Container(
          height: 10,
        ),
      ],
    );
  }

  Widget _centerBody(BuildContext context) {
    return Column(
      children: [
        //контенер красным и оранжевым контейнером
        GreenOrangeHeaderWeb(),
        Container(height: 8,),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _emps.length,
          itemBuilder: (ctx, item){
            return BoxEmployee(
            nameContact: _emps.elementAt(item).name,
            positionContact:  _emps.elementAt(item).position,
            percent: '0.5',
            intStar: 4,
            id:  _emps.elementAt(item).id,
              psbEmployee:  _emps.elementAt(item),
            );
        })
      ],
    );
  }

  Widget _rightBody() {
    return Container();
  }


  void getEmployees() async {
    List<PsbEmployee> emps = [];
    await store.collection("users").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        if (result.data()["group"] != null && result.data()["group"] == "EMPLOYEE")
          emps.add(PsbEmployee.fromMap(result.data()));
      });
    });
    setState(() {
      _emps = emps;
    });

  }
}

class BoxEmployee extends StatelessWidget{
  final String imageContact;

  final String nameContact;

  final String positionContact;
  //сколько процентов проголосовало
  final String percent;
  //количество звезд
  final int intStar;
  final String id;

  final PsbEmployee psbEmployee;

  BoxEmployee({
    this.imageContact = 'assets/mentor1.png',
    required this.percent,
    required this.intStar,
    required this.nameContact,
    required this.positionContact,
    required this.id,
    required this.psbEmployee,
  });

  List<PsbEmployee> _emps = [];


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WebEmployeesOnePage(
              id: id,
              psbEmployee: psbEmployee
            ),
          ),
        );
      },
      hoverColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(border: Border.all(color: const Color(0xFFEFF2F5),width: 2),borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      radius: 50 / 2,
                      backgroundImage: Image.asset(imageContact).image,
                    ),
                  ),
                  Container(width: 12),
                  Expanded(
                    child: _nameAndPosition(),
                  ),
                  Container(width: 10),
                  Column(
                    children: [
                      _tegTaskOrange(2),
                      Container(height: 10,),
                      _tegTaskGreen(),
                    ],
                  ),
                ],
              ),
            ),
            Container(height: 8),
            _progress(),
          ],
        ),
      ),
    );
  }

  //тег с отображением количкства задач для сотрудника
  Widget _tegTaskOrange(int countTask){
    return Container(
      decoration: BoxDecoration(
        color: orangePSB,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
      child: Text(countTask.toString() + ' задачи',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 13,color: Colors.white),),
    );
  }

  //тег с обавлением задач для сотрудника
  Widget _tegTaskGreen(){
    return Container(
      decoration: BoxDecoration(
        color: greenPSB,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
      child: Row(
        children: [
          Icon(Icons.add,color: Colors.white,size: 8,),
          const Text(' добавить',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 13,color: Colors.white),),
        ],
      ),
    );
  }

  Widget _progress(){
    //переводим дробное в проценты
    final double percentConvert = double.tryParse(percent)! * 100;
    //округляем
    final String percentConvertString = percentConvert.round().toString();
    return Container(
      height: 30,
      child: Row(
        children: [
          Text(percentConvertString + '%',style: const TextStyle(color: blackTextPSB,fontSize: 19,fontFamily: 'Gilroy',fontWeight: FontWeight.w400),),
          Expanded(child: _boxProgress())
        ],
      ),
    );
  }

  //плашка с заполнением цветом контейнера показывающая прогресс
  Widget _boxProgress(){
    return LinearPercentIndicator(
      linearStrokeCap: LinearStrokeCap.butt,
      width: 200.0,
      lineHeight: 14.0,
      percent: double.tryParse(percent)!,
      backgroundColor: noActiveStarPSB,
      progressColor: lightBlackTextPSB,
    );
  }

  //центральная часть с именем и должностью
  Widget _nameAndPosition(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(nameContact,style: const TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 16,color: blackTextPSB),),
          Text(
            positionContact,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 14,color: lightBlackTextPSB),
          ),
        ],
      ),
    );
  }

}