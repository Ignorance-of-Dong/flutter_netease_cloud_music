/*
 * @Author: zhangzheng
 * @Date: 2020-04-24 19:03:38
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-04-26 09:45:16
 * @Descripttion: 水波纹按钮
 */
import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  @override
  _GradientButtonState createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 35, 30, 0),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.red]), // 渐变色
          borderRadius: BorderRadius.circular(25)),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.transparent, // 设为透明色
        elevation: 0, // 正常时阴影隐藏
        highlightElevation: 0, // 点击时阴影隐藏
        onPressed: () {},
        child: Container(
          alignment: Alignment.center,
          height: 50,
          child: Text(
            '登 录',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
