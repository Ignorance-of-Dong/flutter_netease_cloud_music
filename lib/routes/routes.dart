/*
 * @Author: zhangzheng
 * @Date: 2020-04-17 14:07:32
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-22 18:47:27
 * @Descripttion: 定义路由模块
 */ 
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './navigatorUtil.dart';
import './routerHandler.dart';

///路由模块定义
class Routes {
  static configureRoutes(Router router) {
    ///无法获取路由，路由错误，返回当前页
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("route is not find !");
        Histroy().pop(context);
      }
    );
    router.define('/home', handler: homeHandler);
    router.define('/layout', handler: layoutHandler);
    router.define('/tel', handler: telHandler);
    router.define('/pwd', handler: pwdHandler);
  }
}