import 'package:flutter/material.dart';
import 'package:juejin_app/constants/constants.dart';
import 'package:juejin_app/models/index_cell.dart';
import 'package:juejin_app/widgets/indexListCell.dart';
import 'package:juejin_app/widgets/indexListHeader.dart';
import '../util/dataUtils.dart';

const pageIndexArray = Constants.RANK_BEFORE;

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<IndexCell> _listData = List();
  int _pageIndex = 0;
  Map<String, dynamic> _params = {
    "src": 'web',
    "category": 'all',
    "limit": '20'
  };
  bool _isRequesting = false;
  bool _hasMore = true;
  ScrollController _scrollController = ScrollController();
  bool _isLogin = false;

  @override
  void initState() {
    getList(false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getList(true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  getList(bool isLoadMore) {
    if (_isRequesting || !_hasMore) return;
    if (!isLoadMore) {
      _pageIndex = 0;
    }
    _params['before'] = pageIndexArray[_pageIndex];
    _isRequesting = true;
    DataUtils.getIndexListData(_params).then((result) {
      _pageIndex += 1;
      List<IndexCell> resultList = List();
      if (isLoadMore) {
        resultList.addAll(_listData);
      }
      resultList.addAll(result);
      if (this.mounted) {
        setState(() {
          _listData = resultList;
          _hasMore = _pageIndex < pageIndexArray.length;
          _isRequesting = false;
        });
      }
    });
  }

  Future<void> _onRefresh() async {
    _listData.clear();
    setState(() {
      _listData = _listData;
      _hasMore = true;
    });
    getList(false);
    return null;
  }

  _renderList(context, index) {
    if (index == 0) {
      return IndexListHeader(false);
    }
    return IndexListCell(cellInfo: _listData[index - 1]);
  }

  @override
  Widget build(BuildContext context) {
  
    if (_listData.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: _listData.length + 1,
        itemBuilder: (context, index) => _renderList(context, index),
        controller: _scrollController,
      ),
      onRefresh: _onRefresh,
    );
  }
}
