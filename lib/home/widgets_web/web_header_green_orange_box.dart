import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

import '../../main.dart';

class GreenOrangeHeaderWeb extends StatelessWidget{
  // final int tasksCount;
  final int employeeCount;


  GreenOrangeHeaderWeb({
    // required this.tasksCount,
    required this.employeeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _oneBoxEmployer()),
        Container(width: 20,),
        Expanded(child: _oneBoxTask())
      ],
    );
  }

  Widget _oneBoxEmployer(){
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 22, 15, 8),
      decoration: BoxDecoration(
        color: greenPSB,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Задачи',style: const TextStyle(color: Colors.white,fontSize: 21,fontFamily: 'Gilroy',fontWeight: FontWeight.w400),),
          StreamBuilder(
            stream: store
                .collectionGroup("tasks")
                .where("creator", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context,  AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                QuerySnapshot snapData = snapshot.data;
                return Text(snapData.docs.length.toString() + ' задач',
                    style: const TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400));
              }
              else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _oneBoxTask(){
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 22, 15, 8),
      decoration: BoxDecoration(
        color: orangePSB,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Онбординг',style: TextStyle(color: Colors.white,fontSize: 21,fontFamily: 'Gilroy',fontWeight: FontWeight.w400),),
          Text(employeeCount.toString() + ' сотрудников',
          style: const TextStyle(color: Colors.white,
              fontSize: 16,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

}