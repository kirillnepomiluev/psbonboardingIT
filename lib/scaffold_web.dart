import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:provider/provider.dart';

import 'auth/model/psb_employee.dart';
import 'home/widgets/search_widget.dart';

class ScaffoldWeb extends StatelessWidget{
  // есть ли плавающая кнопкаSignInPage.dart
  final Widget? floatingActionButton; // Nullable.
  //фото контакта
  final String imageContact;
  //имя контакта
  final String nameContact;
  //должность контакта
  final String positionContact;
  //время последнего сообщения
  final String timeLastMessage;

  //виджет отображающий левую часть страници (страница поделена на три части)
  final Widget bodyLeft;
  //виджет отображающий центральную часть страници (страница поделена на три части)
  final Widget bodyCenter;
  //виджет отображающий правую часть страници (страница поделена на три части)
  final Widget bodyRight;

  final bool? centerAppBar; // Nullable.

  ScaffoldWeb({
    this.floatingActionButton,
    required this.imageContact,
    required this.nameContact,
    required this.positionContact,
    required this.timeLastMessage,
    required this.bodyLeft,
    required this.bodyCenter,
    required this.bodyRight,
    this.centerAppBar = true,
  });

  @override
  Widget build(BuildContext context) {
    //переменная содержит размер ширины экрана
    final mediaSizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: MyAppBarForWeb(
            centerAppBar: centerAppBar,
            timeLastMessage: timeLastMessage,
            positionContact: positionContact,
            nameContact: nameContact,
            imageContact: imageContact,
          ),
        ),
        floatingActionButton: floatingActionButton,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          padding: EdgeInsets.fromLTRB(mediaSizeWidth * 0.05, 0,mediaSizeWidth * 0.05, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(child: Container(child: bodyLeft,width: mediaSizeWidth * 0.20)),
              Container(padding: const EdgeInsets.only(left: 60,right: 60),child: bodyCenter,width: mediaSizeWidth * 0.47),
              Container(child: bodyRight,width: mediaSizeWidth * 0.23,)
            ],
          ),
        ), //
    );
  }

}

//общий апп бар для всех экранов веба
class MyAppBarForWeb extends StatelessWidget {
  //фото контакта
  final String imageContact;
  //имя контакта
  final String nameContact;
  //должность контакта
  final String positionContact;
  //время последнего сообщения
  final String timeLastMessage;
  final bool? centerAppBar;

  MyAppBarForWeb({
    required this.imageContact,
    required this.nameContact,
    required this.positionContact,
    required this.timeLastMessage,
    this.centerAppBar = true,
  });

  final TextEditingController _controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PsbEmployee user = Provider.of<PsbEmployeeModelView>(context, listen: true).psbEmployee;
    //переменная содержит размер ширины экрана
    final mediaSizeWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: mediaSizeWidth * 0.05),
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(child: _boxName(user),width: mediaSizeWidth * 0.20),
          Container(child: centerAppBar! ? _welcomeText(user, context) : Container(),width: mediaSizeWidth * 0.47),
          Container(child: _search(),width: mediaSizeWidth * 0.23,)
        ],
      ),
    );
  }

  //левая чаасть аппбара с визиткой
  Widget _boxName(PsbEmployee user){
    return InkWell(
      onTap: () {},
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF336AF6).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
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
                child: _nameAndPosition(user),
              ),
              Container(width: 10),
            ],
          ),
        )
      ),
    );
  }

  //для _boxName()
  Widget _nameAndPosition(PsbEmployee user){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(user.name,style: const TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 16,color: blackTextPSB),),
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

  // центральная часть с логотипом и приветсвтием
  Widget _welcomeText(PsbEmployee user, BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(margin: const EdgeInsets.only(left: 60),width: 40,height: 40,child: Image.asset('assets/LogoNonText.png',fit: BoxFit.fill,),),
        Container(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Привет',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 22,color: lightBlackTextPSB),),
            Text(user.name,style: const TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Gilroy',fontSize: 42,color: blackTextPSB),),
            Text('у тебя ${user.mark} баллов',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 22,color: lightBlackTextPSB),),
          ],
        ),
        Container(width: 10,),
        InkWell(
          onTap: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, "/LoginScreen");
          },
          child: const Icon(CupertinoIcons.arrow_right_circle,color: blueTextPSB,size: 25,),
        ),
      ],
    );
  }

  Widget _search(){
    return Row(
      children: [
        Icon(Icons.notifications_none,color: lightBlackTextPSB,size: 25,),
        Container(width: 15,),
        Expanded(
          child: SearchInput(
            label: 'Поиск...',
            controller: _controllerSearch,
            height: 46,
          ),
        ),
      ],
    );
  }

}