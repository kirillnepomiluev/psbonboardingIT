import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_digital_finals/widgets/tap_bar_silver/tabstickyheaders.dart';

import 'fixed_height.dart';
import 'my_flaxible_space_bar.dart';

class MainCollapsingToolbar extends StatefulWidget {
  List<String> headers = ["1", "2,", "3"];
  double expandleHeight = 180.0;

  List<Widget>? pages = [Text("111"), Text("222"), Text("333")];
  String? titleMain = "Название";
  TabController? tabcontroller;
  int initialPageIndex;
  Widget? background;
  final int extentTabBarHeight = 20;
  final FixedHeightWidget? topWidget; // Nullable
  bool finder;

  String backgroundColor;
  Color iconMenuColor;
  Color colorFormSearch;
  String? logoColor;
  bool profile;
  bool profilePatient;

  MainCollapsingToolbar(
      {Key? key,
      this.backgroundColor = "blue",
      this.iconMenuColor = Colors.white,
      this.logoColor,
      this.headers = const ["", ""],
      this.pages,
      this.titleMain,
      this.profile = false,
      this.profilePatient = false,
      this.expandleHeight = 90.0,
      this.tabcontroller,
      this.initialPageIndex = 0,
      this.background,
      this.colorFormSearch = Colors.blue,
      this.topWidget,
      this.finder = false})
      : super(key: key);

  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<MainCollapsingToolbar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          _getSliverAppBar(),
          _getSliverUnderAppBar(),
        ];
      },
      body: _getBody(),
    );
  }

  TabBar _getTabBar() {
    return TabBar(
      unselectedLabelColor: Colors.red,
      labelColor: Colors.blue,
      controller: widget.tabcontroller,
      indicatorColor: Colors.transparent,
      indicatorWeight: 2.0,
      unselectedLabelStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 16) /*Theme.of(context).tabBarTheme.unselectedLabelStyle*/,
      labelStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 16) /*Theme.of(context).tabBarTheme.labelStyle*/,
      tabs: stringToTabs(widget.headers),
    );
  }

  Widget _getBody() {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: (widget.pages!.length > 1)
            ? TabBarView(
                controller: widget.tabcontroller,
                children: widget.pages!
                    .map(
                      (page) => SafeArea(
                        top: true,
                        bottom: false,
                        child: Builder(
                          builder: (context) {
                            return _buildTabBarView(context, page);
                          },
                        ),
                      ),
                    )
                    .toList(),
              )
            : widget.pages![0],
      ),
    );
  }

  Widget _getSliverAppBar() {
    return SliverAppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(widget.profile ? 24 : 0),
        ),
      ),
      actions: [
        _getMenuButton(),
      ],
      iconTheme: const IconThemeData(
        color: Colors.blue,
      ),
      backgroundColor: Colors.blue,
      leadingWidth: 51,
      leading: _getLogo(),
      expandedHeight: widget.expandleHeight,
      pinned: true,
      shadowColor: Colors.blue,
      flexibleSpace: FlexibleSpaceBarMy(
        background: widget.background!,
        fadeStart: widget.profile,
        title: _getTitleWidget(),
        centerTitle: false,
        titlePadding: EdgeInsets.zero,
      ),
    );
  }

  Widget _getMenuButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        icon: Icon(
          Icons.menu,
          size: 34,
          color: widget.iconMenuColor,
        ),
        // change this size and style
        onPressed: () => Scaffold.of(context).openEndDrawer(),
      ),
    );
  }

  Widget _getLogo() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Container(
        width: 20,
        decoration: BoxDecoration(),
        child: const Text('sss'),
      ),
    );
  }

  Widget _getSliverUnderAppBar() {
    return SliverPersistentHeader(
      delegate: _getSliverUnderAppBarDelegate(),
      pinned: true,
      floating: false,
    );
  }

  SliverPersistentHeaderDelegate _getSliverUnderAppBarDelegate() {
    if (widget.topWidget != null) {
      return _SliverFixedHeightDelegate(
        child: widget.topWidget!,
        color: widget.colorFormSearch,
      );
    }

    if (widget.pages!.length > 1) {
      return _SliverAppBarDelegate(_getTabBar(),
          extentHeight: widget.extentTabBarHeight,
          profile: widget.profile,
          profilePatient: widget.profilePatient);
    }

    return _SliverSingleTabDelegate();
  }

  Widget _getTitleWidget() {
    if (widget.titleMain == null) {
      // TODO: Log and eliminate nulls.
      return const CircularProgressIndicator();
    }

    return Container(
      margin: const EdgeInsets.only(right: 35),
      child: Text(
        widget.titleMain!,
        style: const TextStyle(fontSize: 17, color: Colors.black),
      ),
    );
  }

  Widget _buildTabBarView(BuildContext context, Widget page) {
    List<Widget> slivers = [];

    slivers.add(SliverObstructionInjector(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)));
    slivers.add(page);

    return page;
  }

  List<Tab> stringToTabs(List<String> _headers) {
    List<Tab> list = [];
    for (var n in _headers) {
      list.add(Tab(
        text: n,
      ));
    }
    return list;
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar,
      {this.extentHeight = 0,
      this.empty = false,
      this.profile = false,
      this.profilePatient = false});

  final TabBar _tabBar;
  final int extentHeight;
  final bool empty;
  final bool profile;
  final bool profilePatient;

  @override
  double get minExtent => _tabBar.preferredSize.height + extentHeight;

  @override
  double get maxExtent => _tabBar.preferredSize.height + extentHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return empty
        ? Container(
            height: _tabBar.preferredSize.height + extentHeight + 1,
          )
        : Container(
            height: _tabBar.preferredSize.height + extentHeight + 1,
            decoration: BoxDecoration(
                color: fonColorAppBar(profile, profilePatient),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24))),
            child: Container(
              margin: EdgeInsets.fromLTRB(profile ? 8 : 20, profile ? 16 : 0,
                  profile ? 8 : 20, profile ? 0 : 16),
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: _tabBar,
            ),
          );
  }

  Color fonColorAppBar(bool profile, bool patientProfile) {
    if (profile == false && patientProfile == true) {
      return Colors.green;
    } else if (profile == true) {
      return Colors.transparent;
    } else {
      return Colors.white;
    }
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _SliverFixedHeightDelegate extends SliverPersistentHeaderDelegate {
  final FixedHeightWidget child;
  final Color color;

  _SliverFixedHeightDelegate({
    required this.child,
    this.color = Colors.white,
  });

  @override
  double get minExtent => child.height;

  @override
  double get maxExtent => child.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      height: child.height,
      padding: const EdgeInsets.fromLTRB(16, 0, 18, 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: child,
    );
  }

  @override
  bool shouldRebuild(_SliverFixedHeightDelegate oldDelegate) {
    return false;
  }
}

class _SliverSingleTabDelegate extends SliverPersistentHeaderDelegate {
  _SliverSingleTabDelegate();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: null,
    );
  }

  @override
  bool shouldRebuild(_SliverSingleTabDelegate oldDelegate) {
    return false;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 0;

  @override
  // TODO: implement minExtent
  double get minExtent => 0;
}
