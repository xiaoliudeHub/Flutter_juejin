import 'package:flutter/material.dart';

class GoodAndCommentCell extends StatelessWidget {
  final int collectionCount;
  final int commentCount;

  GoodAndCommentCell(this.collectionCount, this.commentCount);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20.0,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).accentColor, width: 1.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                size: 12.5,
                color: Theme.of(context).accentColor,
              ),
              Text(
                collectionCount == 0 ? '' : collectionCount.toString(),
                style: TextStyle(
                  fontSize: 11.5,
                  color: Theme.of(context).accentColor,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 20.0,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(color: Theme.of(context).accentColor, width: 1.0),
            left: BorderSide.none,
            right: BorderSide(color: Theme.of(context).accentColor, width: 1.0),
            bottom:
                BorderSide(color: Theme.of(context).accentColor, width: 1.0),
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.speaker_notes,
                size: 12.5,
                color: Theme.of(context).accentColor,
              ),
              Text(
                 commentCount == 0 ? '' : commentCount.toString(),
                 style: TextStyle(
                   fontSize:11.5,
                   color:Theme.of(context).accentColor,
                 ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
