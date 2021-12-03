import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

class BoxTask extends StatelessWidget {
  //назначенное время на задачу
  final DateTime time;
  //в каком формате проходит задача
  final bool online;
  //статус готовности
  bool completed;
  //проверка на первый элемент с вписке
  final bool firstItem;
  //проверка на последний элемент с вписке
  final bool listItem;
  //описание задачи
  final String textTask;
  final QueryDocumentSnapshot docSt;
  final bool nextCompleted;
  final String creator;
  final String employee;
  BoxTask(
      {required this.time,
      required this.online,
      required this.completed,
      required this.firstItem,
      required this.listItem,
      required this.textTask,
        required this.docSt,
        required this.nextCompleted,
        required this.creator,
        required this.employee

      });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 120,
      child: Row(
        children: [
          //плашка показатель выполнености задачи
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  // height: 70,
                  width: firstItem? 0: 1,
                  color: completed ? orangePSB : const Color(0xFFEBEBEB),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: completed ? orangePSB : const Color(0xFFEBEBEB)),
                child: Center(
                    child: completed
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 12,
                          )
                        : Container(
                            color: Colors.white,
                            height: 7,
                            width: 7,
                          )),
              ),
              Expanded(
                      child: Container(
                        // height: 70,
                        width:listItem?0: 1,
                        color:  nextCompleted ? orangePSB : const Color(0xFFEBEBEB),
                      ),
                    )
            ],
          ),
          //формат и время задачи
          Expanded(
            child: Container(
              height: 120,
              // width: 291,
              margin: const EdgeInsets.only(bottom: 10, left: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(
                      color: completed ? arrowRightPSB : Colors.white,
                      width: 1)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16),
                        width: 43,
                        height: 48,
                        child: Column(
                          children: [
                            Container(
                              color: blueTextPSB,
                              height: 24,
                              width: 43,
                              child: Center(
                                  child: Text(
                                    DateFormat('HH:mm').format(time),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              )),
                            ),
                            Container(
                              color: const Color(0xFFF0F0F0),
                              height: 21,
                              width: 43,
                              child: Center(
                                  child: Text(
                                online ? 'онлайн' : 'офлайн',
                                style: const TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(textTask,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w400,
                                      color: blueTextPSB)))),
                      Container(
                          margin: const EdgeInsets.only(top: 0, right: 20, left: 20),
                          child: CupertinoSwitch(
                                activeColor: blueTextPSB,
                                onChanged: (value){
                                  completed = value;
                                  if (completed) {
                                    docSt.reference.update({
                                      "completed" : value,
                                      "completedDate" : DateTime.now(),
                                    });
                                    if (DateTime.now().isBefore(time)) {
                                      int diff = time.difference(DateTime.now()).inMinutes;
                                        if (FirebaseAuth.instance.currentUser!.uid == creator) {
                                          store.collection("users").doc(
                                              employee).update(
                                              {
                                                "marks": FieldValue.increment(
                                                    diff / 2.floor())
                                              });

                                        }
                                        else {
                                          store.collection("users").doc(
                                              FirebaseAuth.instance.currentUser!
                                                  .uid).update(
                                              {
                                                "marks": FieldValue.increment(
                                                    diff / 2.floor())
                                              });


                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Вы завершили задачу на "
                                                        "${diff / 2
                                                        .floor() } минут раньше срока! \n"
                                                        "Вам начислено $diff баллов!"),
                                              );
                                            },
                                          );
                                        }
                                    }
                                  }
                                },
                                value: completed,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.heart,size: 18,color: lightBlackTextPSB,),
                      Container(width: 8,),
                      Text('Нравится',style: TextStyle(color: blackTextPSB,fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 14),),
                      Container(width: 15,),
                      Icon(Icons.comment,size: 18,color: lightBlackTextPSB,),
                      Container(width: 8,),
                      Text('Комментарий',style: TextStyle(color: blackTextPSB,fontWeight: FontWeight.w400,fontFamily: 'Gilroy',fontSize: 14),),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}