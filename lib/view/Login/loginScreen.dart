/*
 * @Author: zhangzheng
 * @Date: 2020-04-26 16:28:39
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-04-26 18:59:46
 * @Descripttion: 手机号登录
 */
import 'package:flutter/material.dart';
import 'package:cloudmusic/widgets/inputForm.dart';
import 'package:cloudmusic/utils/lcfarmSize.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneMobile = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    LcfarmSize.getInstance().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "手机号登录",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 18.0, 0, 0),
            child: Text(
              "未注册手机号登陆后自动创建账号",
              style: TextStyle(
                color: Colors.grey,
                fontSize: LcfarmSize.dp(16.0),
              ),
            ),
          ),
          Container(
            height: 50.0,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50.0,
                child: InputForm(
                  value: phoneMobile,
                  onChange: (value) {
                    print(value);
                  },
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}