/*
 * @Author: zhangzheng
 * @Date: 2020-04-26 14:14:40
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-25 12:02:20
 * @Descripttion: 首页布局 + 侧边栏
 */

import "package:flutter/material.dart";
import 'package:toast/toast.dart';
import '../sidebar/SidebarScreen.dart';
import 'package:flutter/services.dart';
import '../LayoutTabList/findScreen.dart';
import '../LayoutTabList/userScreen.dart';
import '../LayoutTabList/yunCunScreen.dart';
import '../LayoutTabList/videoScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayoutScreen extends StatefulWidget {
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int tabIndex = 1;
  List<Widget> tabListContainer = List();
  List tabBarListData = ["我的", "发现", "云村", "视频"];
  DateTime lastPopTime; //上次点击时间

  @override
  void initState() {
    tabListContainer
    ..add(UserScreen())
    ..add(FindScreen())
    ..add(YunCunScreen())
    ..add(VideoScreen());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1242, height: 2688, allowFontScaling: true);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return WillPopScope(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return buildOpenDraw(context);
              },
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            title: Container(
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                indicator: const BoxDecoration(),
                labelStyle: TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(65)),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle:TextStyle(color: Colors.red, fontSize: ScreenUtil().setSp(55)),
                tabs: <Widget>[
                  Text('我的'), Text('发现'), Text('云村'),Text('视频')
                ],
              )
            ),
            actions: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.search,size: ScreenUtil().setSp(70),color: Colors.black),
              ),
            ],
          ),
          drawer: SidebarScreen(),
          body: Builder(
            builder: (BuildContext context) {
              return Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 4,
                      child: TabBarView(
                        physics: new NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          UserScreen(),
                          FindScreen(),
                          YunCunScreen(),
                          VideoScreen()
                        ],
                      )
                    ),
                  )
                ],
              );
            },
          )
        ),
      ),
      onWillPop: () async{
          // 点击返回键的操作
          if(lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: 2)){
            lastPopTime = DateTime.now();
            Toast.show("再按一次退出", context,
            duration: Toast.LENGTH_SHORT,
            gravity: Toast.BOTTOM,
            backgroundRadius: 4.0);
          }else{
            lastPopTime = DateTime.now();
            // 退出app
            await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }
        },
    );
  }
}
Widget buildOpenDraw(BuildContext context) {
  return InkResponse(
    child: Icon(
      Icons.menu,
      size: ScreenUtil().setSp(70),
      color: Colors.black,
    ),
    onTap: () {
      Scaffold.of(context).openDrawer();
    }
  );
}
