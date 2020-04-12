import 'dart:convert';
import '../models/index_cell.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import '../api/api.dart';
import '../util/net_utils.dart';
import '../models/pins_cell.dart';
import '../models/book_nav.dart';
import '../models/book_cell.dart';

class DataUtils {
  static Future<String> _loadIndexListAsset() async {
    return await rootBundle.loadString('assets/indexListData.json');
  }

  // 首页列表数据
  static Future<List<IndexCell>> getIndexListData(
      Map<String, dynamic> params) async {
    var response = await NetUtils.get(Api.RANK_LIST, params: params);

    var responseList = response['d']['entrylist'];

    List<IndexCell> resultList = new List();
    for (int i = 0; i < responseList.length; i++) {
      try {
        IndexCell cellData = new IndexCell.fromJson(responseList[i]);
        resultList.add(cellData);
      } catch (e) {
        // No specified type, handles all
        print('Something really unknown: $i');
      }
    }

    return resultList;
  }

//沸点 列表
  static Future<List<Pins_cell>> getPinsListData(
      Map<String, dynamic> params) async {
    List<Pins_cell> resultList = List();
    var response = await NetUtils.get(Api.PINS_LIST, params: params);
    var responseList = response['d']['list'];
    for (int i = 0; i < responseList.length; i++) {
      Pins_cell pinsCell;
      try {
        pinsCell = Pins_cell.fromJson(responseList[i]);
      } catch (e) {
        print("error $e at $i");
        continue;
      }
      resultList.add(pinsCell);
    }

    return resultList;
  }

  // 获取小册导航栏
  static Future<List<Book_nav>> getBookNavData() async {
    List<Book_nav> resultList = [];
    var response = await NetUtils.get(Api.BOOK_NAV);
    var responseList = response['d'];
    for (int i = 0; i < responseList.length; i++) {
      Book_nav bookNav;
      try {
        bookNav = Book_nav.fromJson(responseList[i]);
      } catch (e) {
        print("error $e at $i");
        continue;
      }
      resultList.add(bookNav);
    }

    return resultList;
  }

  // 获取小册
  static Future<List<Book_cell>> getBookListData(
      Map<String, dynamic> params) async {
    List<Book_cell> resultList = new List();
    var response = await NetUtils.get(Api.BOOK_LIST, params: params);
    var responseList = response['d'];
    for (int i = 0; i < responseList.length; i++) {
      Book_cell bookCell;
      try {
        bookCell = Book_cell.fromJson(responseList[i]);
      } catch (e) {
        print("error $e at $i");
        continue;
      }
      resultList.add(bookCell);
    }

    return resultList;
  }
}
