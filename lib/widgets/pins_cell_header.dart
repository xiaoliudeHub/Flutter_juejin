import 'package:flutter/material.dart';
import 'package:juejin_app/models/index.dart';
import '../widgets/inTextDot.dart';
import '../models/user.dart';

class PinsCellHeader extends StatelessWidget {
  final User user;
  final String createdAt;

  const PinsCellHeader({Key key, this.user, this.createdAt}) : super(key: key);

  List<Widget> _buildUserInfo() {
    List<Widget> infoList = new List();
    const TextStyle defaultStyle = TextStyle(color: Color(0xFFB2BAC2));

    if (user.jobTitle != "" || user.jobTitle != null) {
      infoList.add(LimitedBox(
        maxWidth: 100.0,
        child: Text(
          user.jobTitle,
          style: defaultStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ));
    }
    if (user.company != "" || user.company != null) {
      infoList.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        child: Text(
          '@',
          style: defaultStyle,
        ),
      ));

      infoList.add(LimitedBox(
        maxWidth: 100.0,
        child: Text(
          user.company,
          style: defaultStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ));
    }

    infoList.add(InTextDot());
    infoList.add(Text(
      createdAt,
      style: defaultStyle,
    ));

    return infoList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 50.0,
                width: 50.0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    user.avatarLarge,
                    scale: 2.0,
                  ),
                )),
          ),
          SizedBox(
            width: 7.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.username,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                children: _buildUserInfo(),
              )
            ],
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PopupMenuButton(
                itemBuilder: (BuildContext context) => <PopupMenuItem>[
                   PopupMenuItem(
                     value: '举报',
                     child: Text('举报'),
                   ),
                ],
                icon: Icon(Icons.more_horiz),
                onSelected: (value) {},
                ),
            ],
          )),
        ],
      ),
    );
  }
}
