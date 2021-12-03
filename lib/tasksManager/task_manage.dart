import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/home/widgets/all_widgets.dart';
import 'package:flutter_app_digital_finals/home/widgets/box_task.dart';
import 'package:flutter_app_digital_finals/main.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:flutter_app_digital_finals/widgets/buttons.dart';

class TaskManageWidget extends StatefulWidget {
  final String employeeID;
  TaskManageWidget({Key? key, required this.employeeID}) : super (key: key);
  @override
  State<TaskManageWidget> createState() => _TaskManageWidgetState();
}

class _TaskManageWidgetState extends State<TaskManageWidget> {
  TextEditingController controllerTaskName = TextEditingController();

  bool taskOnline = false;

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return Container();
    }
    else {
      return  Column(
        children: [
          tasksList(widget.employeeID),
          Container(
          child: Column(children: [
               Text("Новая задача"),
               TextFormField(
                 decoration: InputDecoration( labelText: "описание"),
                 controller: controllerTaskName,

               ),
              Container( ), // TODO тут нужен выбор времени
            Row(
              children: [
               const Text("Задача online" ),
                CupertinoSwitch(
                  activeColor: blueTextPSB,
                  onChanged: (value){
                    taskOnline = value;
                  },
                  value: taskOnline,
                ),
              ],
            ),
            bigButton(onPressed: () {
               store.collection("users").doc(widget.employeeID).collection("tasks").add({
                 'online' :  taskOnline ,
                 "textTask" : controllerTaskName.text,
                 "completed" : false,
                 "time": DateTime.now()
               });
            } , text: "Добавить")

          ],),
          )
        ],
      );
    }
  }

 Widget  tasksList(String userID) {
   if (FirebaseAuth.instance.currentUser == null) {
     return Container();
   }
   else {
     return Container(
       margin: const EdgeInsets.only(bottom: 15),
       child: Column(
         children: [
           appTitle(title: 'Задачи на сегодня'),
           StreamBuilder(
             stream: store
                 .collection("users")
                 .doc(userID)
                 .collection("tasks")
                 .snapshots(),
             builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
               if (snapshot.hasData) {
                 QuerySnapshot snapData = snapshot.data;
                 return ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount: snapData.docs.length,
                   itemBuilder: (context, item) {
                     Map<String, dynamic> data =
                     snapData.docs[item].data() as Map<String, dynamic>;

                     int maxItem = snapData.docs.length;

                     final bool lastItem = item == maxItem - 1;
                     final bool firstItem = item == 0;
                     bool nextCompleted = false;
                     if (!lastItem) {
                       nextCompleted = (snapData.docs[item + 1].data() as Map<
                           String,
                           dynamic>)["completed"];
                     }

                     return BoxTask(
                       firstItem: firstItem,
                       time: (data['time'] as Timestamp).toDate(),
                       online: data["online"],
                       completed: data["completed"],
                       textTask: data["textTask"].toString(),
                       listItem: lastItem,
                       docSt: snapData.docs[item],
                       nextCompleted: nextCompleted,
                     );
                   },
                 );
               } else {
                 return CircularProgressIndicator();
               }
             },
           ),
         ],
       ),
     );
   }

 }
}