
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_digital_finals/auth/model/reward.dart';

import '../../main.dart';

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
  Widget build(BuildContext context) {
    throw Column(
      children: [
        Row(
          children: [
            Text("Вы заработали ${mark} баллов на покупки")
          ],
        )
      ],
    );
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
        _rewards.add(
            Row(
              children: [
                Image.network(element.imageUrl),
                Column(
                  children: [
                    Text(element.reward),
                    Text(element.mark.toString() + " баллов"),
                  ],
                )
              ],
            )
        );
      });

    });
  }

}