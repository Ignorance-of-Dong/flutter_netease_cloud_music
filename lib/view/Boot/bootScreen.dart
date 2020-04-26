/*
 * @Author: zhangzheng
 * @Date: 2020-04-17 14:13:43
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-04-17 14:32:05
 * @Descripttion: App引导页【两秒后关闭 --- 适用于广告】
 */
import 'package:flutter/material.dart';
import '../Home/homeSreen.dart';

class BootScreen extends StatefulWidget {
  @override
  _BootScreenState createState() => _BootScreenState();
}

class _BootScreenState extends State<BootScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => route == null);
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      //透明度动画组件
      opacity: _animation, //执行动画
      child: Image.network(
          //网络图片
          'http://p3.music.126.net/vzu8OZO7TeTZusJ6E3ICHw==/109951164063262746.jpg',
          scale: 2.0, //进行缩放
          fit: BoxFit.cover // 充满父容器
          ),
    );
  }
}