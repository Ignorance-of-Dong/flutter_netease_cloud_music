/*
 * @Author: zhangzheng
 * @Date: 2020-05-07 11:06:00
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-07 14:52:20
 * @Descripttion: 密码校验模块
 */
import 'package:cloudmusic/routes/navigatorUtil.dart';
import 'package:flutter/material.dart';
import 'package:cloudmusic/widgets/inputForm.dart';
import 'package:cloudmusic/utils/lcfarmSize.dart';
import 'package:cloudmusic/widgets/gradientButton.dart';
class PwdScreen extends StatefulWidget {
  final phoneMobile;
  PwdScreen({
    Key key,
    @required this.phoneMobile
  }): super(key: key);
  @override
  _PwdScreenState createState() => _PwdScreenState();
}

class _PwdScreenState extends State<PwdScreen> {
  TextEditingController phoneMobile = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomPadding: false, //输入框抵住键盘 内容不随键盘滚动
      body: Column(
        children: <Widget>[
          Container(
            height: 80.0,
            margin: EdgeInsets.only(top: 30.0),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: InputForm(
                  formKey: _formKey,
                  value: password,
                  isRequest: true,
                  placeholder: "请输入密码",
                  onChange: (value) {
                    
                  },
                )
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 50.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50.0,
                          child: GradientButton(
                            context: context,
                            contextcolor: Colors.red,
                            textColor: Colors.white,
                            text: "提交",
                            handelClick: () {
                              print("登录开始");
                              Histroy().push(
                                context: context,
                                path: "/layout",
                                clearStack: true
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
