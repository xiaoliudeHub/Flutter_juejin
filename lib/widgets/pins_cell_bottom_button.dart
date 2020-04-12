import 'package:flutter/material.dart';

class PinsCellBottomButton extends StatelessWidget {
  final int likedCount;
  final int commentCount;

  Color defaultColor = Colors.black26;
  PinsCellBottomButton({Key key, this.likedCount, this.commentCount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 40.0,
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
          color: defaultColor,
          width: 1.0,
        )),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconWithText(
            icon: Icon(
              Icons.comment,
              size: 18.0,
            ),
            text: commentCount.toString(),
          ),
          IconWithText(
            icon: Icon(
              Icons.favorite,
              size:18.0,
            ),
            text: likedCount.toString(),
          ),
          IconWithText(
             icon: Icon(
               Icons.share,
               size: 18.0,
             ),
             text: '',
          ),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final Icon icon;
  final String text;
  Color defaultColor = Colors.black26;
  IconWithText({Key key, this.icon, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            width: 5.0,
          ),
          Text(
            text,
            style: TextStyle(color: defaultColor),
          ),
        ],
      ),
    );
  }
}
