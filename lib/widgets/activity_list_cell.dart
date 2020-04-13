
import 'package:flutter/material.dart';
import 'package:juejin_app/models/index.dart';
import 'package:juejin_app/util/util.dart';
import 'package:juejin_app/widgets/pins_cell_bottom_button.dart';

class ActivityListCell extends StatelessWidget {
  final Activity_cell activity_cell;
  const ActivityListCell({Key key, this.activity_cell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).accentColor,
              width: 0.5,
            ),
          ),
        ),
        child: Column(
          children: [
            Image.network(
                activity_cell.screenshot,
                fit: BoxFit.cover,
                width: Util.setPercentage(1, context),
                height: 245,
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    // activity_cell.title,
                    '哈哈哈哈',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 20.0),
                  IconWithText(
                    icon: Icon(Icons.calendar_today),
                    text: activity_cell.startTime,
                  ),
                  SizedBox(height: 3.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconWithText(
                        icon: Icon(Icons.location_on),
                        text: activity_cell.city,
                      ),
                      Container(
                        width: 120.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Center(
                          child:Text(
                            '报名参加',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
