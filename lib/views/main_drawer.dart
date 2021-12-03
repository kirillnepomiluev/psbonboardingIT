import 'package:flutter/material.dart';

import '../main.dart';

//выезжающее меню
class MainDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer>
    with AutomaticKeepAliveClientMixin<MainDrawer> {
  //активный индекс
  int index = 0;
  String? imageOnDrawerTop = prefs!.getString("onDrawerTop");
  String? imageOnDrawerDown = prefs!.getString("onDrawerDown");

  bool trip = false;
  bool perex = true;
  bool anotherReason = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return _menu();
  }

  @override
  bool get wantKeepAlive => true;

  Widget _menu(){
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child:
            // imageOnDrawerTop == null ? Text('Загрузка...') :
            DrawerHeader(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    child: Image.asset('assets/logodark.jpg'),
                  ),
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text('Jane'),
                          Row(
                            children: const [
                              Icon(Icons.star),
                              Text('4,2'),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                buildListTile(context,
                    title: "Location settings",
                    direction1: true,
                    direction: "/notifications",
                    mIcon: Icons.star_purple500_sharp,
                    indexNumber: 1),
                buildListTile(context,
                    title: "Settings", direction1: false, onTap: () {}, mIcon: Icons.call, indexNumber: 1),
                buildListTile(context, title: "Edit profile", direction1: false,
                    onTap: () {},
                    // direction: "/calendar",
                    mIcon: Icons.stop_sharp,
                    indexNumber: 2),
                buildListTile(context,
                    direction1: true,
                    title: "Notifications",
                    direction: "/settings",
                    mIcon: Icons.settings,
                    indexNumber: 3),
                buildListTile(context,
                    direction1: true,
                    title: "Likes",
                    direction: "/statistic2",
                    mIcon: Icons.list_alt,
                    indexNumber: 4)              ],
            ),
          ),
          Expanded(
            child: RaisedButton(
              color: Colors.white,
              onPressed: () {
                // FirebaseAuth.instance.signOut();
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Row(
                  children: const [
                    Icon(Icons.exit_to_app),
                    Text('Exit'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context, {
        int indexNumber = 0,
        bool direction1 = false,
        direction = '/',
        IconData? mIcon,
        title = "Главная",
        Function? onTap
      }) {
    bool selected = index == indexNumber ? true : false;
    Color? _iconColor = selected
        ? Theme.of(context).textTheme.headline3!.color
        : Theme.of(context).textTheme.headline4!.color;
    TextStyle? _textStyle = selected
        ? Theme.of(context).textTheme.headline3
        : Theme.of(context).textTheme.headline4;

    return ListTile(
        selected: selected,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Icon(
                    mIcon,
                    color: _iconColor,
                  )),
              Expanded(
                flex: 6,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: Text(
                    title,
                    style: _textStyle,
                  ),
                ),
              )
            ]),
        onTap: () {
          direction1 ? Navigator.pushNamed(context, direction) : onTap!();
        });
  }


}
