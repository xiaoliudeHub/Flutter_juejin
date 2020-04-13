import 'package:flutter/material.dart';
import 'package:juejin_app/models/index.dart';
import 'package:juejin_app/widgets/pins_cell_bottom_button.dart';
import '../models/repos_cell.dart';

class ReposListCell extends StatelessWidget {
  final Repos_cell repos_cell;
  const ReposListCell({Key key, this.repos_cell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Theme.of(context).accentColor, width: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              // repos_cell.repoName,
              '开源库的名称',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            child: Text(
              // repos_cell.description,
              '这是一个开源库啊',
              style: TextStyle(
                fontSize: 15.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildBottomInfo(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBottomInfo() {
    List<Widget> _listRow = List();
    _listRow.add(IconWithText(
      icon: Icon(Icons.check_circle),
      text: 'dart',
    ));
    _listRow.add(
      SizedBox(
        width: 10.0,
      ),
    );
    _listRow.add(
      IconWithText(
        icon: Icon(Icons.collections),
        text: '100',
      ),
    );
    _listRow.add(
      SizedBox(
        width: 10.0,
      ),
    );
    _listRow.add(
      IconWithText(
        icon: Icon(Icons.share),
        text: '200',
      ),
    );
    _listRow.add(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          '2020年4月5号 10:41',
          style: TextStyle(color: Colors.grey, fontSize: 14.0),
        ),
      ),
    );
    return _listRow;
  }
}

class IconTextWidget extends StatelessWidget {
  final Icon icon;
  final String text;

  const IconTextWidget({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          width: 5.0,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
