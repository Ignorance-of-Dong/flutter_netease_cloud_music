/*
 * @Author: zhangzheng
 * @Date: 2020-04-17 14:04:45
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-21 18:09:53
 * @Descripttion: 状态管理模块
 */

import '../api/index.dart';
import 'package:flutter/material.dart';
class CounterNotifier with ChangeNotifier {
  var _userInfo = {};
  List _bannerList = List(); // banner图列表
  List _recommendedSongList = List(); // 每日推荐列表
  List _topList = List(); // 榜单歌单列表
  List _djList = List();

  // =============>> 常量映射 <<============== //
  dynamic get userInfo => _userInfo;
  List get bannerList => _bannerList;
  List get recommendedSongList => _recommendedSongList;
  List get topList => _topList;
  List get djList => _djList;

  // =============>> 获取方法 <<============== //

  // 获取用户的登录信息
  getUserInfo() {
    
  }

  // =============>> 获取banner <<============== //
  getBannerList(context) async{
    var result = await NetWorkList().apiBannerList(context: context);
    _bannerList = result['banners'];
    notifyListeners();
  }

  // =============>> 获取推荐歌单 <<============== //
  getRecommendedSongList(context, params) async{
    var result = await NetWorkList().apiPersonalizedSongList(context: context, params: params);
    _recommendedSongList = result['result'];
    notifyListeners();
  }

  // =============>> 处理首页推荐电音数据 <<============== //
  handleDjList(djList) async{
    List dj = List();
    List aee = List();
    for (var i = 0; i < djList.length; i++) {
      if (aee.length == 3) {
        dj..add({"djList": aee});
        aee = List();
      }
      if(dj.length == 4) return;
      aee..add(djList[i]);
    }
    _djList = dj;
    notifyListeners();
    print(dj);
  }

  // =============>> 获取榜单类别数据 <<============== //
  getTopList(context, params) async{
    var result = await NetWorkList().apiTopList(context: context, params: params);
    handleDjList(result['playlist']['tracks']);
    _topList = result['playlist']['tracks'];
    // print(result['playlist']['tracks']);
  }


  // increment() {
  //   _count++;
  //   notifyListeners();
  // }
  // getActiveList(context) async{
  //   var listm = await NetWorkList().apiActiveList(context: context);
  //   _activelist = listm['data']['data'];
  //   notifyListeners();
  // }
  // getActiveDetail(context, params) async{
  //   var listm = await NetWorkList().apiActiveDetail(context: context, params: params);
  //   _activeDetails = listm['data']['data'];
  //   notifyListeners();
  // }
}