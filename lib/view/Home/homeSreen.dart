/*
 * @Author: zhangzheng
 * @Date: 2020-04-17 14:15:35
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-25 11:57:38
 * @Descripttion: App首页（登录 + 游客入口）
 */
import 'package:cloudmusic/routes/navigatorUtil.dart';
import 'package:flutter/material.dart';
import 'package:cloudmusic/utils/lcfarmSize.dart';
import 'package:cloudmusic/widgets/gradientButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1242, height: 2688, allowFontScaling: true);
    LcfarmSize.getInstance().init(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Positioned(
                    top: 100.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100.0,
                      child: Center(
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          child: ClipOval(
                            child: Container(
                              width: 80.0,
                              height: 80.0,
                              color: Colors.red,
                              child: Image.network(
                                //网络图片
                                'http://music.ignorantscholar.cn/images/e0603518b18c6f6eaa378ad19773fd23.png',
                                scale: 2.0, //进行缩放
                                fit: BoxFit.cover // 充满父容器
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ),
                  Positioned(
                    bottom: 70.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: ScreenUtil().setHeight(500),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: ScreenUtil().setHeight(200),
                            child: GradientButton(
                              context: context,
                              handelClick: () {
                                print("触发事件");
                                Histroy().push(
                                  context: context,
                                  path: '/tel',
                                );
                              },
                              contextcolor: Colors.white,
                              text: "手机号登录",
                              textColor: Colors.red,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: ScreenUtil().setHeight(200),
                            margin: EdgeInsets.only(top: 10.0),
                            child: GradientButton(
                              context: context,
                              handelClick: () {
                                print("触发事件");
                                Histroy().push(
                                  context: context,
                                  path: '/layout',
                                );
                              },
                              text: "游客登录",
                              contextcolor: Colors.red,
                              textColor: Colors.white,
                            ),
                          )
                        ],
                      )
                    )
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}