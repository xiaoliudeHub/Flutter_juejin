import 'package:flutter/material.dart';

class PinsCellUrl extends StatelessWidget {
  final String url;
  final String urlPic;
  final String urlTitle;

  const PinsCellUrl({Key key, this.url, this.urlPic, this.urlTitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
        height: 100.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).accentColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    urlTitle,
                    style:
                        TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    url,
                    style: TextStyle(
                        fontSize: 15.0, color: Theme.of(context).accentColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              flex: 2,
            ),
            Expanded(child: Image.network(urlPic),
            flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
