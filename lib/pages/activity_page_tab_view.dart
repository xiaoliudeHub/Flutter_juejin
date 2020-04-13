import 'package:flutter/material.dart';
import 'package:juejin_app/models/index.dart';
import 'package:juejin_app/util/dataUtils.dart';
import 'package:juejin_app/widgets/activity_list_cell.dart';
import 'package:juejin_app/widgets/load_more.dart';

class ActivityPageTableView extends StatefulWidget {
  final String alias;

  const ActivityPageTableView({Key key, this.alias}) : super(key: key);
  @override
  _ActivityPageTableViewState createState() => _ActivityPageTableViewState();
}

class _ActivityPageTableViewState extends State<ActivityPageTableView> {
  final Map<String, dynamic> _params = {
    "uid": "",
    "client_id": "",
    "token": "",
    "src": "web",
    "orderType": "startTime",
    "cityAlias": "",
    "pageNum": "",
    "pageSize": "",
  };
  List<Activity_cell> _cellList = [];
  bool _hasMore = true;
  bool _isRequesting = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _getList(false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getList(true);
      }
    });
    super.initState();
  }

  _getList(bool isLoadMore) {
    if (!_hasMore || _isRequesting) return;

    if (!isLoadMore) {
      _params['pageNum'] = 1;
    }

    _params['cityAlias']=widget.alias;

    DataUtils.getActivityList(_params).then((resultData) {
      List<Activity_cell> _mergeList = [];
      if (isLoadMore) {
        _mergeList.addAll(_cellList);
      }
      _mergeList.addAll(resultData);
      if (this.mounted) {
        setState(() {
          _cellList = _mergeList;
          _hasMore = resultData.length != 0;
        });
      }
      _params['pageNum'] = _params['pageNum'] + 1;

      // 发现有单页数据少于20的情况，当选择城市的时候
      if(resultData.length<20){
        _getList(true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _itemBuilder(context, index) {
    if (index == _cellList.length) {
       return LoadMore(_hasMore);
    }
    return ActivityListCell(activity_cell:_cellList[index]);
  }

  @override
  Widget build(BuildContext context) {
    if (_cellList.length==0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
       color: Colors.black12,
       child: ListView.builder(
         controller: _scrollController,
         itemCount: _cellList.length + 1,
         itemBuilder: _itemBuilder,
         shrinkWrap: true,
       ),
    );
  }
}