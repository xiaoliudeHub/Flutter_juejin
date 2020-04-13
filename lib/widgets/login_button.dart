import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:juejin_app/routers/application.dart';

class LoginButton extends StatelessWidget {
  final String userName;
  final String userPic;

  const LoginButton({Key key, this.userName, this.userPic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (userName == '') {
      return FlatButton(
        onPressed: () {
          Application.router.navigateTo(context, '/login', transition: TransitionType.fadeIn);
        },
        child: Text(
          '登录 · 注册',
           style: TextStyle(
             color: Colors.white,
             fontSize: 16.0,
            fontWeight: FontWeight.w200,
           ),
        ),
      );
    }
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(userPic),
            child: Text(userName),
          )
        ],
      ),
    );
  }
}
