/*
 * @Author: zhangzheng
 * @Date: 2020-04-26 14:14:40
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-04-26 18:25:22
 * @Descripttion: 首页布局 + 侧边栏
 */

import "package:flutter/material.dart";
import 'package:cloudmusic/utils/lcfarmSize.dart';
import '../sidebar/SidebarScreen.dart';

class LayoutScreen extends StatefulWidget {
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int tabIndex = 1;
  List tabBarListData = ["我的", "发现", "云村", "视频"];
  
  @override
  Widget build(BuildContext context) {
    LcfarmSize.getInstance().init(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final TextStyle tabTextstyle = TextStyle(
      fontSize: LcfarmSize.dp(18),
      color: Colors.grey,
    );
    final TextStyle selectionTextstyle = TextStyle(
      fontSize: LcfarmSize.dp(23),
      color: Colors.black,
    );
    return Scaffold(
      drawer: SidebarScreen(),
      body: Builder(
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: statusBarHeight),
                  height: 60.0,
                  // color: Colors.red,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: buildOpenDraw(context)
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          // color: Colors.blue,
                          child: Builder(
                            builder: (BuildContext context) {
                              List<Widget> tiles = [];
                              for (var i = 0; i < tabBarListData.length; i++) {
                                tiles.add(
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: InkResponse(
                                        child: Text(
                                          tabBarListData[i],
                                          style: tabIndex == i ? selectionTextstyle : tabTextstyle,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            tabIndex = i;
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                );
                              }
                              Widget content = Row(
                                children: tiles
                              );
                              return content;
                            }
                          )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.white,
                          child: InkResponse(
                            child: Icon(
                              Icons.search,
                              size: 30.0,
                            ),
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            }
                          ),
                        ),
                      )
                    ],
                  ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  // color: Colors.red,
                ),
              )
            ],
          );
        },
      )
    );
  }
}
Widget buildOpenDraw(BuildContext context) {
  return InkResponse(
    child: Icon(
      Icons.menu,
      size: 30.0,
    ),
    onTap: () {
      Scaffold.of(context).openDrawer();
    }
  );
}
