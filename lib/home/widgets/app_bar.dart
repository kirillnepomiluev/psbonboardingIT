import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_digital_finals/home/widgets/search_widget.dart';
import 'package:flutter_app_digital_finals/themes/colors.dart';

class CustomAppBar extends StatelessWidget{
  //высота аппбара
  final double? height;
  //текст внутри аппбара
  final String? description;
  //что будет под аппбаром
  final SliverChildBuilderDelegate sliverChildBuilderDelegate;
  //текстовый контроллер относится к поисковой форме
  final TextEditingController controllerSearch;

  CustomAppBar({
    this.height,
    this.description,
    required this.sliverChildBuilderDelegate,
    required this.controllerSearch,
  });

  final actions = Row(
    children: <Widget>[
      OutlinedButton(
        child: const Text('Follow'),
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(color: Colors.white),
          ),
          foregroundColor:
          MaterialStateProperty.all(Colors.white),
          side: MaterialStateProperty.all(
            const BorderSide(
              color: Colors.orange,
            ),
          ),
        ),
        onPressed: () {},
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return SafeArea(
      child: CustomScrollView(
        ///in case,list is not full screen and remove ios Bouncing
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          ExtendedSliverAppbar(
            onBuild: (
                BuildContext context,
                double shrinkOffset,
                double? minExtent,
                double maxExtent,
                bool overlapsContent,
                ) {
              if (shrinkOffset > 0) {
                // onBuildController.sink.add(null);
              }
            },
            title: const Text(
              'ExtendedSliverAppbar',
              style: TextStyle(color: Colors.black),
            ),
            leading: const BackButton(
              onPressed: null,
              color: Colors.white,
            ),
            background: DefaultTextStyle(
              style: const TextStyle(color: Colors.white),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: arrowRightPSB.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 4
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25))
                ),
                padding: const EdgeInsets.only(left: 40,right: 40,top: 40),
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Привет, Ольга!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontFamily: 'Gilroy',fontSize: 22),),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none,size: 23,color: Color(0xFF84848E),))
                      ],
                    ),
                    const Text('ПСБ рад видеть Вас в команде',
                        style: TextStyle(
                            color: lightBlackTextPSB,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gilroy',
                            fontSize: 14
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 15,bottom: 20),
                      child: SearchInput(controller: controllerSearch,label: 'Вызвать помощника',),
                    ),
                  ],
                ),
              ),
            ),
            actions: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SearchInput(controller: controllerSearch,label: 'Вызвать помощника',),
            ),
          ),
          //pinned box
          // SliverPinnedToBoxAdapter(
          //   child: Container(
          //     margin: const EdgeInsets.fromLTRB(10,0,10,10),
          //     child: SearchInput(controller: controllerSearch,label: 'Вызвать помощника',),
          //   ),
          // ),
          SliverList(
            delegate: sliverChildBuilderDelegate,
          ),
        ],
      ),
    );
  }

}

class FollowButton extends StatefulWidget {
  // const FollowButton(this.onBuildController, this.followButtonController);
  // final StreamController<void> onBuildController;
  // final StreamController<bool> followButtonController;
  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool showFollowButton = false;
  @override
  void initState() {
    super.initState();
    // widget.onBuildController.stream.listen((_) {
    //   if (mounted) {
    //     final double statusBarHeight = MediaQuery.of(context).padding.top;
    //     final RenderBox renderBox = context.findRenderObject() as RenderBox;
    //     final Offset position = renderBox.localToGlobal(Offset.zero);
    //     final bool show = position.dy + renderBox.size.height <
    //         statusBarHeight + kToolbarHeight;
    //     if (showFollowButton != show) {
    //       showFollowButton = show;
    //       widget.followButtonController.sink.add(showFollowButton);
    //     }
    //     //print('${position.dy + renderBox.size.height} ----- ${statusBarHeight + kToolbarHeight}');
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      //MaterialTapTargetSize.padded min 48
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: OutlinedButton(
        child: const Text('Follow'),
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(color: Colors.white),
          ),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          side: MaterialStateProperty.all(
            const BorderSide(
              color: Colors.orange,
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}