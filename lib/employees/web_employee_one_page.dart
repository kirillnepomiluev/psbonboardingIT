import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/auth/model/psb_employee.dart';
import 'package:flutter_app_digital_finals/home/widgets_web/web_navigation_menu.dart';
import 'package:flutter_app_digital_finals/profile/profile_page.dart';
import 'package:flutter_app_digital_finals/profile/widgets/prize_profile_box.dart';
import 'package:flutter_app_digital_finals/tasksManager/task_manage.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../my_scaffold.dart';

class WebEmployeesOnePage extends StatelessWidget{
  String id;
  PsbEmployee psbEmployee;

  WebEmployeesOnePage({required this.id,required this.psbEmployee});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      centerAppBar: false,
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
    return SingleChildScrollView(
      child: Column(
        children: [
          _appbar(context),
          _allInfoEmployee(),
          _prizes()
        ],
      ),
    );
  }

  //список призов
  Widget _prizes(){
    return Container(
      padding: const EdgeInsets.only(top: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: prizes.length,
          shrinkWrap: true,
          itemBuilder: (ctx, item){
            return Column(
              children: [
                PrizeCard(
                  imagePrize: prizes[item]['imagePrize'],
                  namePrize: prizes[item]['namePrize'],
                  textBodyPrize: prizes[item]['textBodyPrize'],
                ),
                Container(height: 15,)
              ],
            );
          }),
    );
  }

  Widget _allInfoEmployee(){
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: const Color(0xFFF9F9F9)),
        child: Column(
          children: [
            _cardInfoEmployee(),
            _cardInfoEmployee(name: 'Рабочий телефон',value: '8 (363) 22 22 22'),
            _cardInfoEmployee(name: 'E-mail',value: 'O_L')
          ],
        )
    );
  }

  Widget _cardInfoEmployee({String name = 'Мобильный номер',String value = '8 (961) 295 22 72'}){
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name,style: const TextStyle(fontWeight: FontWeight.w700,color: blackTextPSB,fontSize: 16,fontFamily: 'Gilroy'),),
          Text(value,style: const TextStyle(fontWeight: FontWeight.w700,color: blackTextPSB,fontSize: 16,fontFamily: 'Gilroy'),),
        ],
      ),
    );
  }

  //строчка с фото
  Widget _rowPhoto(BuildContext context){
    return Row(
      children: [
        IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_rounded,color: blackTextPSB,size: 23,)),
        const Spacer(),
        SizedBox(width: 130,height: 130,child: Image.asset('assets/imageMyContactPhoto.png',fit: BoxFit.fill,)),
        const Spacer(),
        IconButton(onPressed: (){}, icon: const Icon(Icons.settings,color: lightBlackTextPSB,size: 23,))
      ],
    );
  }

  //строчка со статистикой
  Widget _rowStatistics(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _statisticsBox(),
        _statisticsBox(color: const Color(0xFF50A8FF),countBal: 'Дизайн',lable: 'проект',icon: const Icon(CupertinoIcons.book,color: Color(0xFF50A8FF),size: 26,)),
        _statisticsBox(color: const Color(0xFF4DC591),countBal: 'Полная',lable: 'занятость',icon: const Icon(Icons.star_border,color: Color(0xFF4DC591),size: 26,)),
      ],);
  }

  //котейнер со статистикой
  Widget _statisticsBox({Color color = const Color(0xFFFF7648),String countBal = '01.11.21',String lable = 'Дата найма',Icon icon = const Icon(Icons.star_border,color: orangePSB,size: 26,)}){
    return Container(
      child: Column(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.1),
            ),
            child: Center(child: icon,),
          ),
          Container(height: 8,),
          Text(countBal,style: const TextStyle(color: blackTextPSB,fontSize: 20,fontFamily: 'Gilroy',fontWeight: FontWeight.w400),),
          Container(height: 8,),
          Text(lable,style: const TextStyle(color: lightBlackTextPSB,fontSize: 14,fontFamily: 'Gilroy',fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }

  //апп бар
  Widget _appbar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          //строчка с фото
          _rowPhoto(context),
          Container(height: 20,),
          Text(psbEmployee.name,style: const TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Gilroy',fontSize: 24,color: blackTextPSB),),
          Text('Product Designer',style: const TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 14,color: lightBlackTextPSB),),
          Container(height: 20,),
          //строчка со статистикой
          _rowStatistics(),
          Container(height: 20,),
        ],
      ),
    );
  }

  Widget _rightBody() {
    return TaskManageWidget(employeeID: id,);
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

  BoxEmployee({
    this.imageContact = 'assets/mentor1.png',
    required this.percent,
    required this.intStar,
    required this.nameContact,
    required this.positionContact,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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