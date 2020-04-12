import 'package:flutter/material.dart';
import 'package:juejin_app/models/index.dart';
import 'package:juejin_app/pages/book_page_tab_view.dart';
import 'package:juejin_app/util/dataUtils.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage>
    with SingleTickerProviderStateMixin {
  List<Book_nav> _navData = List();
  List<Tab> _myTabs = <Tab>[
    Tab(
      text: '全部',
    ),
  ];

  List<BookPageTabView> _myTabView = <BookPageTabView>[
    BookPageTabView(
      alias: 'all',
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    getNavList();
  }

  getNavList() {
    DataUtils.getBookNavData().then((resultData) {
      resultData.forEach((booknav) {
        _myTabs.add(Tab(
          text: booknav.name,
        ));
        _myTabView.add(BookPageTabView(
          alias: booknav.alias,
        ));
      });
      if (this.mounted) {
        setState(() {
          _navData = resultData;
        });
        _tabController = TabController(length: _navData.length+1, vsync: this);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_navData.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: TabBar(
          tabs: _myTabs,
          controller: _tabController,
          indicatorColor: Colors.white,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        children: _myTabView,
        controller: _tabController,
      ),
    );
  }
}
