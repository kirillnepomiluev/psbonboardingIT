import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/home/widgets/all_widgets.dart';
import 'package:flutter_app_digital_finals/home/widgets/box_task.dart';
import 'package:flutter_app_digital_finals/main.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';
import 'package:flutter_app_digital_finals/widgets/buttons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class TaskManageWidget extends StatefulWidget {
  final String employeeID;

  TaskManageWidget({Key? key, required this.employeeID}) : super(key: key);

  @override
  State<TaskManageWidget> createState() => _TaskManageWidgetState();
}

class _TaskManageWidgetState extends State<TaskManageWidget> {
  var _birthDate = DateTime.now();
  TextEditingController controllerTaskName = TextEditingController();
  TextEditingController controllerHeader = TextEditingController();

  bool taskOnline = false;

  int _radioValue1 = 0;


  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return Container();
    } else {
      return kIsWeb ? SingleChildScrollView(
        child: Column(
          children: [
            tasksList(widget.employeeID),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFF9F9F9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Новая задача",style: TextStyle(color: blackTextPSB,fontWeight: FontWeight.w400,fontSize: 20,fontFamily: 'Gilroy'),),
                  Container(height: 8,),
                  _textField(
                    labelText: "Описание",
                    controller: controllerTaskName,
                  ),
                  Container(height: 8,),
                  CustomDateSelector(
                    context,
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    "Выберите время делайна",
                    _birthDate,
                    _onBirthDateChanged,
                    const BoxDecoration(
                      color: Color(0xFFF9F9F9)
                    ),
                  ),
                  Container(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Задача online",style: TextStyle(fontFamily: 'Gilroy',fontSize: 16,color: blackTextPSB,fontWeight: FontWeight.w400),),
                      CupertinoSwitch(
                        activeColor: blueTextPSB,
                        onChanged: (value) {
                          setState(() {
                            taskOnline = value;
                          });
                        },
                        value: taskOnline,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Кто закрывает задачу",style: TextStyle(fontFamily: 'Gilroy',fontSize: 16,color: blackTextPSB,fontWeight: FontWeight.w400),),
                      Row(
                        children: [
                          Radio(
                            activeColor: orangePSB,
                            value: 0,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          InkWell(
                            onTap: () {
                              _handleRadioValueChange1(0);
                              },
                            child: const Text(
                              'Сотрудник',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          Radio(
                            activeColor: orangePSB,
                            value: 1,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          InkWell(
                            onTap: () {
                              _handleRadioValueChange1(1);
                            },
                            child: const Text(
                              'Настваник',
                              style:  TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Radio(
                             activeColor: orangePSB,
                            value: 2,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          InkWell(
                            onTap: () {
                              _handleRadioValueChange1(2);
                            },
                            child: const Text(
                              'Тест',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(height: 10,),
                  bigButton(
                      onPressed: () {
                        store
                            .collection("users")
                            .doc(widget.employeeID)
                            .collection("tasks")
                            .add({
                          'online': taskOnline,
                          "textTask": controllerTaskName.text,
                          "completed": false,
                          "time": _birthDate,
                          "closeType" :  _radioValue1==0? "employee" : _radioValue1==1? "lead" : "test",
                          "creator" : FirebaseAuth.instance.currentUser!.uid,
                          "employee": widget.employeeID,
                        });
                      },
                      text: "Добавить")
                ],
              ),
            )
          ],
        ),
      ) : Container(
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFF9F9F9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Новая задача",style: TextStyle(color: blackTextPSB,fontWeight: FontWeight.w400,fontSize: 20,fontFamily: 'Gilroy'),),
            Container(height: 8,),
            _textField(
              labelText: "Описание",
              controller: controllerTaskName,
            ),
            Container(height: 8,),
            CustomDateSelector(
              context,
              const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              "Выберите время делайна",
              _birthDate,
              _onBirthDateChanged,
              const BoxDecoration(
                  color: Color(0xFFF9F9F9)
              ),
            ),
            Container(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Задача online",style: TextStyle(fontFamily: 'Gilroy',fontSize: 16,color: blackTextPSB,fontWeight: FontWeight.w400),),
                CupertinoSwitch(
                  activeColor: blueTextPSB,
                  onChanged: (value) {
                    setState(() {
                      taskOnline = value;
                    });
                  },
                  value: taskOnline,
                ),
              ],
            ),
            Column(
              children: [
                const Text("Кто закрывает задачу",style: TextStyle(fontFamily: 'Gilroy',fontSize: 16,color: blackTextPSB,fontWeight: FontWeight.w400),),
                Column(
                  children: [
                    Row(children: [
                      Radio(
                        activeColor: orangePSB,
                        value: 0,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      InkWell(
                        onTap: () {
                          _handleRadioValueChange1(0);
                        },
                        child: const Text(
                          'Сотрудник',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],),
                    Row(children: [
                      Radio(
                        activeColor: orangePSB,
                        value: 1,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      InkWell(
                        onTap: () {
                          _handleRadioValueChange1(1);
                        },
                        child: const Text(
                          'Настваник',
                          style:  TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],),
                    Row(
                      children: [
                        Radio(
                          activeColor: orangePSB,
                          value: 2,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1,
                        ),
                        InkWell(
                          onTap: () {
                            _handleRadioValueChange1(2);
                          },
                          child: const Text(
                            'Тест',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(height: 10,),
            bigButton(
                onPressed: () {
                  store
                      .collection("users")
                      .doc(widget.employeeID)
                      .collection("tasks")
                      .add({
                    'online': taskOnline,
                    "textTask": controllerTaskName.text,
                    "completed": false,
                    "time": _birthDate,
                    "closeType" :  _radioValue1==0? "employee" : _radioValue1==1? "lead" : "test",
                    "creator" : FirebaseAuth.instance.currentUser!.uid,
                    "employee": widget.employeeID,
                  });

                  Navigator.pop(context);
                },
                text: "Добавить")
          ],
        ),
      );
    }
  }

  void _handleRadioValueChange1(int? value) {
    setState(() {
      _radioValue1 = value?? -1;
    });


  }

  Widget _textField({TextEditingController? controller,String labelText = 'Описание'}){
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(68)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFieldFilter(
                context,
                const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                hinttext: labelText,
                controller: controller,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onBirthDateChanged(DateTime value) {
    setState(() {
      _birthDate = value;
    });
  }


  Widget tasksList(String userID) {
    if (FirebaseAuth.instance.currentUser == null) {
      return Container();
    } else {

      return Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            appTitle(title: 'Задачи на сегодня'),
            StreamBuilder(
              stream: store
                  .collection("users")
                  .doc(userID)
                  .collection("tasks").orderBy("time")
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
                        nextCompleted = (snapData.docs[item + 1].data()
                            as Map<String, dynamic>)["completed"];
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
                        creator: data["creator"].toString(),
                        employee: data["employee"].toString(),
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

  Widget CustomDateSelector(
      BuildContext context,
      EdgeInsetsGeometry margin,
      String hint,
      DateTime dateTime,
      Function(DateTime) callback,
      BoxDecoration decoration) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: decoration,
      child: InkWell(
        onTap: () {
          final firstDate = DateTime(DateTime.now().year - 100);
          final lastDate = DateTime(DateTime.now().year - 18, DateTime.now().month, DateTime.now().day);

        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hint,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: lightBlackTextPSB),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: DateTimePicker(
                      type: DateTimePickerType.dateTimeSeparate,
                      dateMask: 'd MMM, yyyy',
                      initialValue: DateTime.now().toString(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days:60 )),
                      icon: Icon(Icons.event),
                      dateLabelText: 'Date',
                      timeLabelText: "Hour",
                      onChanged: (val) {
                          callback( DateTime.tryParse(val)?? DateTime.now());

                      },





                      validator: (val) {
                        print(val);
                        return null;
                      },
                      onSaved: (val) => print(" timePicked  " +val.toString())
                         ,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String dateFullFromMilliseconds(int time) {
    if (time == null) {
      return "Not assigned";
    }
    DateTime date = DateTime.fromMillisecondsSinceEpoch((time));

    return DateFormat('dd MMMM yyyy', 'en_US').format(date);
  }


}
