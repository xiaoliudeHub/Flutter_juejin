import 'package:flutter/material.dart';
import 'package:juejin_app/constants/constants.dart';
import 'package:juejin_app/models/index.dart';
import 'package:juejin_app/util/dataUtils.dart';
import 'package:juejin_app/widgets/load_more.dart';
import 'package:juejin_app/widgets/repos_list_cell.dart';

class ReposPage extends StatefulWidget {
  @override
  _ReposPageState createState() => _ReposPageState();
}

class _ReposPageState extends State<ReposPage> {
  
  List<Repos_cell> _dataArray = List();
  int _indexPage = 0;
  Map<String, dynamic> _params = {"src": 'web', "limit": 20};
  bool _hasMore = true;
  ScrollController _scrollController = ScrollController();
  bool _isRequesting = false;

  @override
  void initState() {
    // _getListData(false);
    // _scrollController.addListener(() {
    //    if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     // _getListData(true);
    //   }
    // });
    super.initState();
  }

  _getListData(bool isLoadMore) {
    if (_isRequesting || !_hasMore) return;
    if (isLoadMore) {
      _params['before'] = Constants.REPOS_BEFOR[_indexPage];
    }else{
      _indexPage = -1;
    }
    _isRequesting = true;
    DataUtils.getReposListData(_params).then((resultData) {
      if (this.mounted) {
        _indexPage+=1;
        List<Repos_cell> resultList = [];
        if (isLoadMore) {
          resultList.addAll(_dataArray);
        }
        resultList.addAll(resultData);

        setState(() {
          _dataArray = resultList;
          _hasMore = _indexPage < Constants.REPOS_BEFOR.length;
          _isRequesting = false;
        });
      }
    });
  }

  // @override
  // void dispose() {
    
  //   super.dispose();
  //   _scrollController.dispose();
  // }
  
  Widget _itemBuilder(context, index) {
    // if (index == _dataArray.length+1) {
    //    return LoadMore(_hasMore);
    // }
    // if (index==0) {
      
    // }
    
    return ReposListCell(repos_cell: null);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: 5,
      controller: _scrollController,
    );
  }
}