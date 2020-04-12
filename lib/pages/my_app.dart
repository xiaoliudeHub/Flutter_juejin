import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './activity_page.dart';
import './book_page.dart';
import './index_page.dart';
import './pins_page.dart';
import './repons_page.dart';
import '../routers/routes.dart';
import '../routers/application.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

_MyAppState() {
  final router = Router();
  // final eventBus = EventBus();
  Routes.configureRoutes(router);
  Application.router = router;
}

  final TextStyle tabTextStyleNormal =
      TextStyle(color: const Color(0xffdddddd));
  final TextStyle tabTextStyleSelectd =
      TextStyle(color: const Color(0xff4d91fd));

  final List<Tab> _bottomTabs = <Tab>[
    Tab(
      text: '首页',
      icon: Icon(Icons.home),
    ),
    Tab(
      text: '沸点',
      icon: Icon(Icons.chat),
    ),
    Tab(
      text: '小册',
      icon: Icon(Icons.book),
    ),
    Tab(
      text: '开源库',
      icon: Icon(Icons.bubble_chart),
    ),
    Tab(
      text: '活动',
      icon: Icon(Icons.local_activity),
    ),
  ];

  // var _body;
  // List _appBarTitles = ['首页', '沸点', '小册', '开源库', '活动'];

  TabController _tabController;

  @override
  void initState() {
        _tabController = TabController(length: _bottomTabs.length, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, width:750, height:1334, allowFontScaling: true);
    return Container(
      child: MaterialApp(
        theme: ThemeData(primaryColor: const Color.fromRGBO(77, 145, 253, 1.0)),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter版掘金'),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
               IndexPage(),
               PinsPage(),
               BookPage(),
               ReposPage(),
               ActivityPage()
            ],
          ),
          bottomNavigationBar: Material(
            color: Theme.of(context).primaryColor,
            child: TabBar(tabs: _bottomTabs, controller: _tabController, indicatorColor: Colors.white,),
          ),
        ),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
