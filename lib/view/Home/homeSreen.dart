/*
 * @Author: zhangzheng
 * @Date: 2020-04-17 14:15:35
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-04-24 19:07:10
 * @Descripttion: App首页（登录 + 游客入口）
 */
import 'package:flutter/material.dart';
import 'package:cloudmusic/utils/lcfarmSize.dart';
import 'package:cloudmusic/widgets/gradientButton.dart';

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
                              color: Colors.yellow,
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
                    bottom: 80.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120.0,
                      color: Colors.white,
                      child: GradientButton(),
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