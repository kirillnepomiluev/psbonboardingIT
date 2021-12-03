
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/auth/model/guide_element.dart';
import 'package:flutter_app_digital_finals/course/list_courses_page.dart';
import 'package:flutter_app_digital_finals/home/widgets/all_widgets.dart';
import 'package:flutter_app_digital_finals/home/widgets_web/web_navigation_menu.dart';
import 'package:flutter_app_digital_finals/profile/widgets/prize_widget_web.dart';
import 'package:hovering/hovering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_app_digital_finals/home/web_home_page.dart' as home;

import '../main.dart';
import '../my_scaffold.dart';

class KnowledgeBaseWidget extends StatefulWidget {


  @override
  _KnowledgeBaseState createState() => _KnowledgeBaseState();
}

class _KnowledgeBaseState extends State<KnowledgeBaseWidget> {

  List<Widget> _guideElements = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGuides();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bodyRight: _rightBody(),
      bodyCenter: Column(
        children: _guideElements,
      ),
      bodyLeft: _leftBody(),
    );
  }

  Widget _leftBody() {
    return Column(
      children: [
        WebNavigationMenu(
          activeItem: NavigationItem.knowledgeBase,
        ),
        Container(
          height: 10,
        ),
        appTitle(title: 'Команда'),
        home.listContact(),
      ],
    );
  }

  Widget _rightBody() {
    return home.boxTasksToday();
  }

  void getGuides() async {
    List<GuideElement> guideElements = [];
    await store.collection("knowledge").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        guideElements.add(GuideElement.fromMap(result.data()));
      });
    });
    setState(() {
      guideElements.forEach((element) {
        _guideElements.add(
            HoverWidget(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: element.name,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () { launch(element.link);
                          },
                      ),
                    ),
                  ),
                ),
                hoverChild: Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(3.0))
                  ),
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: element.name,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () { launch(element.link);
                          },
                      ),
                    ),
                  ),
                ),
                onHover: (h) {})
        );
      });

    });
  }
}