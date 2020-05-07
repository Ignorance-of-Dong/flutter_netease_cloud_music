/*
 * @Author: zhangzheng
 * @Date: 2020-04-26 16:28:39
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-04-30 15:34:47
 * @Descripttion: 手机号登录
 */
import 'package:flutter/material.dart';
import 'package:cloudmusic/widgets/inputForm.dart';
import 'package:cloudmusic/utils/lcfarmSize.dart';
import 'package:cloudmusic/widgets/gradientButton.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneMobile = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RegExp mobile = new RegExp(r"(0|86|17951)?(13[0-9]|15[0-35-9]|17[0678]|18[0-9]|14[57])[0-9]{8}");
  bool isPass = false;
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
      resizeToAvoidBottomPadding: false, //输入框抵住键盘 内容不随键盘滚动
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
            height: 80.0,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Builder(
                  builder: (BuildContext context) {
                    if (!isPass) {
                      return InputForm(
                        formKey: _formKey,
                        value: phoneMobile,
                        rules: mobile,
                        isRules: true,
                        isRequest: true,
                        errorTip: "请输入正确的手机号",
                        placeholder: "请输入手机号",
                        onChange: (value) {
                          
                        },
                      );
                    } else {
                      return InputForm(
                        formKey: _formKey,
                        value: password,
                        isRequest: true,
                        placeholder: "请输入密码",
                        onChange: (value) {
                          
                        },
                      );
                    }
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
                            text: !isPass ? "下一步" : "提交",
                            handelClick: () {
                              if (!isPass) {
                                if (_formKey.currentState.validate()) {
                                  print('校验通过');
                                  setState(() {
                                    isPass = true;
                                  });
                                } else {
                                  print('校验失败');
                                }
                              } else {
                                print("登录开始");
                              }
                              
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