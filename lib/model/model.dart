/*
 * @Author: zhangzheng
 * @Date: 2020-04-17 14:04:45
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-19 14:04:34
 * @Descripttion: 状态管理模块
 */
import '../api/index.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class CounterNotifier with ChangeNotifier {
  var _userInfo = {};
  List _bannerList = List();
  // int _count = 0;
  // List _activelist = List();
  // var _activeDetails = {};

  // bool get ispass => _ispass;
  // int get count => _count;
  // List get activelist => _activelist;
  dynamic get userInfo => _userInfo;
  List get bannerList => _bannerList;

  // 获取用户的登录信息
  getUserInfo() {
    
  }

  // 获取banner
  getBannerList(context) async{
    var result = await NetWorkList().apiBannerList(context: context);
    _bannerList = result['banners'];
    print(result['banners']);
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