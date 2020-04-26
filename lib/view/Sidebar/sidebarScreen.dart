/*
 * @Author: zhangzheng
 * @Date: 2020-04-26 16:23:50
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-04-26 16:26:14
 * @Descripttion: 侧边栏布局
 */
import 'package:flutter/material.dart';

class SidebarScreen extends StatefulWidget {
  @override
  _SidebarScreenState createState() => _SidebarScreenState();
}

class _SidebarScreenState extends State<SidebarScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("菜单一"),
          Text("菜单二"),
          Text("菜单三"),
          Text("菜单四"),
          Text("菜单五"),
        ],
      ),
    );
  }
}