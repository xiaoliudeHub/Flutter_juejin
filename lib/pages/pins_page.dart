import 'package:flutter/material.dart';
import 'package:juejin_app/util/dataUtils.dart';
import 'package:juejin_app/widgets/load_more.dart';
import 'package:juejin_app/widgets/pins_list_cell.dart';
import '../models/pins_cell.dart';

class PinsPage extends StatefulWidget {
  @override
  _PinsPageState createState() => _PinsPageState();
}

class _PinsPageState extends State<PinsPage> {
  List<Pins_cell> _listData = List();
  Map<String, dynamic> _params = {
    "src": 'web',
    "uid": "",
    "limit": 20,
    "device_id": "",
    "token": ""
  };

  bool _isRequesting = false;
  bool _hasMore = true;
  String before = "";
  ScrollController _scrollController = ScrollController();

  void getPinsList(bool isLoadMore) {
    if (_isRequesting || !_hasMore) {
      return;
    }
    if (before != '') {
      return;
    }
    if (!isLoadMore) {
      _params['before'] = '';
    }
    _isRequesting = true;
    before = DateTime.now().toString().replaceFirst(RegExp(r' '), 'T') + 'Z';
    DataUtils.getPinsListData(_params).then((resultData) {
      print(resultData);
      List<Pins_cell> resultList = List();
      if (isLoadMore) {
        resultList.addAll(_listData);
      }
      resultList.addAll(resultData);
      if (this.mounted) {
        setState(() {
          _listData = resultList;
          _hasMore = resultData.length != 0;
          _isRequesting = false;
        });
      }
    });
  }

  Widget _itemBuilder(context, index) {
    if (index == _listData.length) {
        return LoadMore(_hasMore);
    }
    return PinsListCell(pinsCell: _listData[index]);

    
  }

  @override
  void initState() {
    getPinsList(false);
    super.initState();
    _scrollController.addListener(() {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
            getPinsList(true);
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_listData.length > 0) {
      return Container(
        color: Color(0xFFF4F5F5),
        child: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: _listData.length,
          controller: _scrollController,
        ),
      );
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
