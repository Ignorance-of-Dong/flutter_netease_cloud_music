/*
 * @Author: zhangzheng
 * @Date: 2020-05-07 11:03:14
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-25 14:07:27
 * @Descripttion: 手机号验证页面
 */
import 'package:cloudmusic/routes/navigatorUtil.dart';
import 'package:flutter/material.dart';
import 'package:cloudmusic/widgets/inputForm.dart';
import 'package:cloudmusic/widgets/gradientButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TelScreen extends StatefulWidget {
  @override
  _TelScreenState createState() => _TelScreenState();
}

class _TelScreenState extends State<TelScreen> {
  TextEditingController phoneMobile = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RegExp mobile = new RegExp(r"(0|86|17951)?(13[0-9]|15[0-35-9]|17[0678]|18[0-9]|14[57])[0-9]{8}");
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1242, height: 2688, allowFontScaling: true);
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
            width: MediaQuery.of(context).size.width,
            height: ScreenUtil().setHeight(200),
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 18.0, 0, 0),
            child: Text(
              "未注册手机号登陆后自动创建账号",
              style: TextStyle(
                color: Colors.grey,
                fontSize: ScreenUtil().setSp(50),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(300),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: InputForm(
                  formKey: _formKey,
                  value: phoneMobile,
                  rules: mobile,
                  isRules: true,
                  isRequest: true,
                  errorTip: "请输入正确的手机号",
                  placeholder: "请输入手机号",
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
                  bottom: ScreenUtil().setHeight(180),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: ScreenUtil().setHeight(180),
                          child: GradientButton(
                            context: context,
                            contextcolor: Colors.red,
                            textColor: Colors.white,
                            text: "下一步",
                            handelClick: () {
                              if (_formKey.currentState.validate()) {
                                Histroy().push(
                                  context: context,
                                  path: '/pwd?phoneMobile=${phoneMobile.text}',
                                );
                              } else {
                                print('校验失败');
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