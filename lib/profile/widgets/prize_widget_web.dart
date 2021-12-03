

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/home/widgets/all_widgets.dart';

class PrizeWidget extends StatefulWidget {


  PrizeWidget();

  @override
  _PrizeWidgetState createState() => _PrizeWidgetState();

}

class _PrizeWidgetState extends State<PrizeWidget> {

  _PrizeWidgetState();




  @override
  Widget build(BuildContext context) {
    return boxPrizes();
  }

  //контенер с наградами
  Widget boxPrizes (){
    return Container(
      margin: const EdgeInsets.only(bottom: 15,top: 0),
      height: 115,
      child: Column(
        children: [
          appTitle(title: 'Ваши награды'),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: prizes.length,
              itemBuilder: (context, item) {
                return Container(
                  padding: const EdgeInsets.only(top: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: MouseRegion(
                      onHover: (value) {
                        setState(() {
                          debugPrint("HOV");
                          prizes[item]['hovered'] = true;
                        });
                      },
                      onExit: (value) {
                        setState(() {
                          debugPrint("NOHOV");
                          prizes[item]['hovered'] = false;
                        });
                      },
                      child: Stack(
                        children: [
                          MouseRegion(
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(prizes[item]['imagePrize'],fit: BoxFit.fill,),
                            ),
                          ),
                          prizes[item]['hovered'] ? Container(
                            decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(Radius.circular(3.0))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(prizes[item]['namePrize'], style: ThemeData.light().textTheme.bodyText1,),
                                Text(prizes[item]['textBodyPrize'], style: ThemeData.light().textTheme.headline2),
                              ],
                            ),
                          ) : Container()
                        ],
                      )
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> prizes = [
  {
    'imagePrize': 'assets/prizeOne.png',
    'namePrize': 'Старательный ученик',
    'textBodyPrize': 'Завершил половину курса',
    'hovered': false
  },
  {
    'imagePrize': 'assets/prizeTwo.png',
    'namePrize': 'Аккуратный',
    'textBodyPrize': 'Порядок на рабочем месте',
    'hovered': false
  },
  {
    'imagePrize': 'assets/prizeThree.png',
    'namePrize': 'Под защитой',
    'textBodyPrize': 'Вовремя меняешь доступы',
    'hovered': false
  },
  {
    'imagePrize': 'assets/prizeFour.png',
    'namePrize': 'Душа коллектива',
    'textBodyPrize': 'Все коллеги от тебя без ума!',
    'hovered': false
  },
  {
    'imagePrize': 'assets/prizeFive.png',
    'namePrize': 'Любопытный',
    'textBodyPrize': 'Регулярно задаешь ментору хорошие вопросы',
    'hovered': false
  },
];

