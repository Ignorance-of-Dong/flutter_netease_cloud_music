/*
 * @Author: zhangzheng
 * @Date: 2020-04-17 14:04:45
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-22 18:33:03
 * @Descripttion: 状态管理模块 === > 兼职数据处理
 */

import '../api/index.dart';
import 'package:flutter/material.dart';
class CounterNotifier with ChangeNotifier {

  // =============>> 变量定义 <<============== //
  var _userInfo = {};
  List<Widget> _bannerList = List(); // banner图列表
  List _recommendedSongList = List(); // 每日推荐列表
  List _topList = List(); // 榜单歌单列表
  List<Widget> _djList = List();

  // =============>> 变量映射 <<============== //
  dynamic get userInfo => _userInfo;
  List<Widget> get bannerList => _bannerList;
  List get recommendedSongList => _recommendedSongList;
  List get topList => _topList;
  List<Widget> get djList => _djList;

  // =============>> 获取方法 <<============== //

  // =============>> 获取用户的登录信息 <<============== //
  getUserInfo() {}

  // =============>> 获取banner <<============== //
  getBannerList(context) async{
    var result = await NetWorkList().apiBannerList(context: context);
    List<Widget> view = List();
    List banners = result['banners'];
    for(var i = 0; i < banners.length; i++){
      view..add(
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(banners[i]['pic']),
              fit: BoxFit.cover
            )
          )
        )
      );
    }
    _bannerList = view;
    notifyListeners();
  }

  // =============>> 获取推荐歌单 <<============== //
  getRecommendedSongList(context, params) async{
    var result = await NetWorkList().apiPersonalizedSongList(context: context, params: params);
    _recommendedSongList = result['result'];
    notifyListeners();
  }

  // =============>> 处理首页推荐电音数据 <<============== //
  handleDjList(context, djList) async{
    List dj = List();
    List aee = List();
    List<Widget> view = List();
    for (var i = 0; i < djList.length; i++) {
      if (aee.length == 3) {
        dj..add({"djList": aee});
        aee = List();
      }
      if(dj.length == 4) {
        for(var i = 0; i < dj.length; i++){
          view..add(
            Container(
              width: MediaQuery.of(context).size.width - 50,
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
                children: _childView(context, dj[i]['djList'])
              )
            ),
          );
        }
        _djList = view;
        notifyListeners();
        return;
      }
      aee..add(djList[i]);
    }
  }

  // =============>> 电音子数据模板承载 <<============== //
  List<Widget> _childView(context, djlists) {
    List<Widget> views = List();
    for (var i = 0; i < djlists.length; i++) {
      views..add(
        Container(
          height: 80.0,
          color: Colors.white,
          margin: EdgeInsets.only(top: 5.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(djlists[i]["al"]["picUrl"]),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 35.0,
                        child: Text(
                          djlists[i]["name"],
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.0
                          ),
                        ),
                      ),
                      Container(
                        height: 16.0,
                        child: Text(
                          djlists[i]["ar"][0]["name"],
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 70.0,
                height: 80.0,
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.play_circle_filled
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    return views;
  }

  // =============>> 获取榜单类别数据 <<============== //
  getTopList(context, params) async{
    var result = await NetWorkList().apiTopList(context: context, params: params);
    handleDjList(context, result['playlist']['tracks']);
    _topList = result['playlist']['tracks'];
    notifyListeners();
  }
  
}