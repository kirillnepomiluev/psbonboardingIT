import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/router.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:flutter_app_digital_finals/widgets/buttons.dart';

//экран приветсвия
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _logo(context),
          Expanded(child: _text(context)),
          Container(
              margin: const EdgeInsets.only(bottom: 40, left: 40, right: 40),
              child: bigButton(
                  text: 'Начать',
                  onPressed: () =>
                      Navigator.pushNamed(context, RouteNames.home))),
        ],
      ),
    );
  }

  //картинка приветсвия
  Widget _logo(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.58,
      width: MediaQuery.of(context).size.width * 1,
      child: Image.asset(
        'assets/imageWelcome.png',
        fit: BoxFit.fill,
      ),
    );
  }

  //основной текст
  Widget _text(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 40, right: 40, top: 43),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Добро пожаловать!',
            style: TextStyle(
                color: blackTextPSB,
                fontSize: 22,
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal),
          ),
          Container(height: 18),
          const Text(
              'Мы познакомим Вас с Промсвязьбанком, поможем адаптироваться в коллективе, изучить работу и функционал.',
              style: TextStyle(
                  color: lightBlackTextPSB,
                  fontSize: 14,
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal)),
        ],
      ),
    );
  }
}
