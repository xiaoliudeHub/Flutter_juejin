import 'package:flutter/material.dart';
import 'package:juejin_app/models/index.dart';
import 'package:juejin_app/pages/activity_page_tab_view.dart';
import 'package:juejin_app/util/dataUtils.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with SingleTickerProviderStateMixin {
  Map<String, dynamic> _params = {
    "uid": '',
    "client_id": "",
    "token": "",
    "src": "web"
  };
  List<Activity_nav> navList = [];
  List<ActivityPageTableView> _myTabViw = [
    ActivityPageTableView(
      alias: "",
    ),
  ];
  List<Tab> _myTab = [
    Tab(
      text: '全部',
    ),
  ];
  TabController _tabController;

  @override
  void initState() {
    _getNavList(false);
    super.initState();
  }

  _getNavList(bool isLoadMore) {
    DataUtils.getActivityNavList(_params).then((resultData) {
      resultData.forEach((ele) {
        _myTab.add(Tab(
          text: ele.cityName,
        ));
        _myTabViw.add(ActivityPageTableView(
          alias: ele.cityAlias,
        ));
      });
      if (this.mounted) {
        setState(() {
          navList = resultData;
        });
      }
      _tabController = TabController(vsync: this, length: navList.length + 1);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (navList.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: TabBar(
          tabs: _myTab,
          controller: _tabController,
          indicatorColor: Colors.white,
          isScrollable: true,
        ),
      ),
      body: TabBarView(children: _myTabViw, controller: _tabController,),
    );
  }
}
