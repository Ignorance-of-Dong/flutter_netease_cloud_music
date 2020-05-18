/*
 * @Author: zhangzheng
 * @Date: 2020-05-08 17:22:12
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-11 11:11:22
 * @Descripttion: 发现模块
 */
import "package:flutter/material.dart";
import "package:cloudmusic/widgets/tabSwitching.dart";

class FindScreen extends StatefulWidget {
  @override
  _FindScreenState createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      color: Colors.red,
      // child: TabSwitching(context: context)
    );
  }
}
