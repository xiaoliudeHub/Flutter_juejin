import 'package:flutter/material.dart';
import 'package:juejin_app/models/index.dart';
import 'package:juejin_app/widgets/inTextDot.dart';
import '../util/util.dart';

class BookListCell extends StatelessWidget {
  final Book_cell bookcell;
  const BookListCell({Key key, this.bookcell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle _grayTextStyle = TextStyle(
      fontSize: 13.0,
      color: Colors.grey,
    );

    final Color accentColor = Theme.of(context).accentColor;
    final Color primaryColor = Theme.of(context).primaryColor;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Util.setPercentage(0.03, context), vertical: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: accentColor, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.only(right: Util.setPercentage(0.03, context)),
            child: Image.network(
              bookcell.img,
              width: Util.setPercentage(0.2, context),
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: Util.setPercentage(0.5, context),
            margin: EdgeInsets.only(right: Util.setPercentage(0.1, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookcell.title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF34383B),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  bookcell.userData.username,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF34383B),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    LimitedBox(
                      maxWidth: 100.0,
                      child: Text(
                        '${bookcell.lastSectionCount.toString()}小节',
                        style: _grayTextStyle,
                      ),
                    ),
                    InTextDot(),
                    LimitedBox(
                      child: Text(
                        '${bookcell.buyCount.toString()}人已购买',
                        style: _grayTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal:15.0, vertical: 15.0),
            // decoration: BoxDecoration(
            //   color:Color(0xFFF0F7FF),
            //   borderRadius: BorderRadius.all(Radius.circular(15.0)),
            // ),
            child: Text(
              '¥${bookcell.price.toString()}',
              style: TextStyle(
                color: primaryColor,
                fontSize: 13.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
