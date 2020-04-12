import 'package:flutter/material.dart';
import 'package:juejin_app/models/index.dart';

class PinsCellTopic extends StatelessWidget {
  final Topic_info topicInfo;

  const PinsCellTopic({Key key, this.topicInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _taxtColor = Theme.of(context).primaryColor;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:15.0, vertical:1.5),
        decoration: BoxDecoration(
          border:Border.all(
            color: _taxtColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.horizontal(
             left: Radius.circular(15.0),
             right: Radius.circular(15.0),
          ),
          
        ),
        child: Text(topicInfo.title, style: TextStyle(color:_taxtColor),),
      ),
    );
  }
}
