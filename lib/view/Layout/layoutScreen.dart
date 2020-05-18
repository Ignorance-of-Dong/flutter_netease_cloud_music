/*
 * @Author: zhangzheng
 * @Date: 2020-04-26 14:14:40
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-11 11:59:01
 * @Descripttion: 首页布局 + 侧边栏
 */

import "package:flutter/material.dart";
import 'package:cloudmusic/utils/lcfarmSize.dart';
import 'package:toast/toast.dart';
import '../sidebar/SidebarScreen.dart';
import 'package:flutter/services.dart';
import '../LayoutTabList/findScreen.dart';
import '../LayoutTabList/userScreen.dart';
import '../LayoutTabList/yunCunScreen.dart';
import '../LayoutTabList/videoScreen.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


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
    LcfarmSize.getInstance().init(context);
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
            backgroundColor: Colors.white,
            title: Container(
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                indicator: const BoxDecoration(),
                labelStyle: TextStyle(color: Colors.grey, fontSize: LcfarmSize.dp(19)),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle:TextStyle(color: Colors.red, fontSize: LcfarmSize.dp(14)),
                tabs: <Widget>[
                  Text('我的'), Text('发现'), Text('云村'),Text('视频')
                ],
              )
            ),
            actions: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.search,size: 25.0,color: Colors.black),
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
                      color: Colors.red,
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
      size: 25.0,
      color: Colors.black,
    ),
    onTap: () {
      Scaffold.of(context).openDrawer();
    }
  );
}
