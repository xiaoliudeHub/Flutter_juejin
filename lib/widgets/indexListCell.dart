import 'package:flutter/material.dart';
import 'package:juejin_app/widgets/goodAndCommentCell.dart';
import '../models/index_cell.dart';
import '../widgets/inTextDot.dart';
import '../routers/application.dart';
import 'dart:core';

class IndexListCell extends StatelessWidget {
  final IndexCell cellInfo;
  IndexListCell({Key key, this.cellInfo}) : super(key: key);

  final TextStyle titleTextStyle = TextStyle(
    color: Color(0xFFB2BAC2),
    fontWeight: FontWeight.w300,
    fontSize: 13.0,
  );

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
         Application.router.navigateTo(context, "/detail?id=${Uri.encodeComponent(cellInfo.detailUrl)}&title=${Uri.encodeComponent(cellInfo.title)}");
      },
      child: Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(
            height:20.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _buildFirstRow(),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 9.0),
            child: Text(
              cellInfo.title,
              style: TextStyle(
                color:Color(0xFF393C3F),
                fontSize:14.0,
                fontWeight:FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GoodAndCommentCell(cellInfo.collectionCount, cellInfo.commentCount),
          SizedBox(
            height: 15.0,
          ),
          Divider(
            height: 2.0,
          ),
        ]
      ),
    ),
    );
    
    
  }

  List<Widget> _buildFirstRow() {
    List<Widget> _listRow = List();
    if (cellInfo.hot) {
      _listRow.add(Text(
        '热',
        style: TextStyle(
          color: Color(0xFFF53040),
          fontWeight: FontWeight.w600,
        ),
      ));
      _listRow.add(InTextDot());
    }
    if (cellInfo.isCollection == 'post') {
      _listRow.add(Text(
        '专栏',
        style: TextStyle(
          color: Color(0xFFBC30DA),
          fontWeight: FontWeight.w600,
        ),
      ));
      _listRow.add(InTextDot());
    }
    _listRow.add(Text(cellInfo.username, style: titleTextStyle));
    _listRow.add(InTextDot());
    _listRow.add(Text(cellInfo.createdTime, style: titleTextStyle));
    _listRow.add(InTextDot());
    _listRow.add(Expanded(
      child: Text(
        cellInfo.tag,
        style: titleTextStyle,
        overflow: TextOverflow.ellipsis,
      ),
    ));
    return _listRow;
  }
}
