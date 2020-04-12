import 'package:flutter/material.dart';

class PinsCellLink extends StatelessWidget {
  final String linkUrl;
  PinsCellLink({Key key, this.linkUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color textColor = Theme.of(context).primaryColor;
    return Container(
      width: 100.0,
      child: InkWell(
        onTap: () {},
        child: Row(
           children:[
             Icon(
               Icons.link,
               color:textColor
             ),
             Text(
               '网页链接',
               style: TextStyle(color: textColor),
             )
           ],
        ),
      ),
    );
  }
}
