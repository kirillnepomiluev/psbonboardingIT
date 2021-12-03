import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/auth/model/psb_employee.dart';
import 'package:flutter_app_digital_finals/auth/widgets/form_widget.dart';
import 'package:flutter_app_digital_finals/course/models/project_model.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:flutter_app_digital_finals/widgets/buttons.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../main.dart';

//экран авторизации_
class LoginScreen extends StatelessWidget {
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 1,child: Column(
            children: [
              Image.asset('assets/authWebImage.png'),
              // const Text('Добро пожаловать!',style: TextStyle(color: blackTextPSB, fontSize: 22, fontFamily: "Gilroy", fontWeight: FontWeight.w700, fontStyle: FontStyle.normal),),
              // const Text('Мы познакомим Вас с Промсвязьбанком, поможем адаптироваться в коллективе, изучить работу и функционал.',style: TextStyle(color: lightBlackTextPSB, fontSize: 14, fontFamily: "Gilroy", fontWeight: FontWeight.w400, fontStyle: FontStyle.normal))
            ],
          )),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _logo(),
                  Container(height: 50,),
                  const Text(
                    'Вход',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Gilroy',
                        color: blackTextPSB,
                        fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    'Введите Ваши логин/пароль',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Gilroy',
                        color: blackTextPSB,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(height: 15,),
                  TextFormFieldForAuthPage(controller: _controllerLogin, label: 'Логин',isEye: false,),
                  Container(height: 25,),
                  TextFormFieldForAuthPage(controller: _controllerPassword, label: 'Пароль',icon: const Icon(CupertinoIcons.lock,color: blackTextPSB,size: 21,),obscureText: true,isEye: true,),
                  Container(height: 10),
                  //текстовая кнопка забыли пароль
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _textButton(),
                    ],
                  ),
                  Container(height: 25,),
Consumer<PsbEmployeeModelView>( builder: (context, value, child) {
  return             bigButton(
            text: 'Войти',onPressed: () async { await login(context, _controllerLogin.text, _controllerPassword.text, value); }
  );
},),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //логотип
  Widget _logo() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
          child: Image.asset('assets/logoPSB.png'),
          height: 51,
          width: 170,
        ),
      ),
    );
  }

  //текстовая кнопка "Забыли пароль"
  Widget _textButton(){
    return TextButton(
        onPressed: (){},
        child: const Text(
          'Забыли пароль',
          style: TextStyle(
              fontSize: 16,
              fontFamily: 'Gilroy',
              color: blueTextPSB,
              fontWeight: FontWeight.w400),
        )
    );
  }

  Future<void> login(BuildContext context, String email, String password, PsbEmployeeModelView employee) async {
    debugPrint("email $email login $login");
  var persistance = FirebaseAuth.instance;
    persistance.setPersistence(Persistence.LOCAL);

    persistance.signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential value) async {
      if (value.user != null) {
        employee.getPsbEmployeeFromFirebase(value.user!.uid);
        Navigator.pushNamed(context, "/");
      }
    })
        .catchError((error) {
      debugPrint(error);
          showToast("Авторизация не удалась!", Colors.red);
        });
  }

  void showToast(message, Color color) {
    print(message);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

}
