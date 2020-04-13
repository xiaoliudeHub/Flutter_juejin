import 'package:flutter/material.dart';
import '../routers/application.dart';
import '../event/event_bus.dart';
import '../event/event_model.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _userName = '';
  String _password = '';
  String _userPic =
      'https://user-gold-cdn.xitu.io/2017/12/18/1606900c1392ea33?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1';

  _userNameChange(String val) {
    setState(() {
      _userName = val;
    });
  }

  _passwordChange(String val) {
    setState(() {
      _password = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    icon: Icon(Icons.person),
                    labelText: '请输入用户名'),
                onChanged: _userNameChange,
                autofocus: false,
              ),
              SizedBox(height: 20.0),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  icon: Icon(Icons.security),
                  labelText: '请输入密码',
                ),
                onChanged: _passwordChange,
                autofocus: false,
                obscureText: true,
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(onPressed: () {
                  if (_userName != '' && _password != '') {
                    Application.router.pop(context);
                    ApplicationEvent.event
                        .fire(UserLoginEvent(_userName,_userPic));
                  }
                },
                color: Theme.of(context).primaryColor,
                child: Text('登陆',
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
