import 'package:flutter/cupertino.dart';
import 'package:flutter_app_digital_finals/auth/model/reward.dart';
import 'package:flutter_app_digital_finals/home/widgets/all_widgets.dart';
import 'package:flutter_app_digital_finals/home/widgets_web/web_navigation_menu.dart';
import 'package:flutter_app_digital_finals/home/web_home_page.dart' as home;
import 'package:flutter_app_digital_finals/themes/colors.dart';
import '../../main.dart';
import '../../my_scaffold.dart';

class RewardWidget extends StatefulWidget {
  final int mark;

  RewardWidget(this.mark);

  @override
  RewardWidgetState createState() => RewardWidgetState(mark);
}

class RewardWidgetState extends State<RewardWidget> {
  List<Widget> _rewards = [];
  int mark;

  RewardWidgetState(this.mark);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRewards();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bodyRight: _rightBody(),
      bodyCenter: Column(
        children: _rewards,
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
        appTitle(title: 'Награды'),
        home.listContact(),
      ],
    );
  }

  Widget _rightBody() {
    return home.boxTasksToday();
  }

  void getRewards() async {
    List<Reward> guideElements = [];
    await store.collection("rewards").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        guideElements.add(Reward.fromMap(result.data()));
      });
    });
    setState(() {
      guideElements.forEach((element) {
        _rewards.add(Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset(
                'assets/imageHeaderCourse.png',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                Text(
                  element.reward,
                  style: const TextStyle(
                      color: blackTextPSB,
                      fontSize: 22,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  element.mark.toString() + " баллов",
                  style: const TextStyle(
                      color: blackTextPSB,
                      fontSize: 17,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ));
      });
    });
  }
}
