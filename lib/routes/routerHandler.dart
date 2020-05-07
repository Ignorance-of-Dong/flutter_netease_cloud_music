import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../view//Boot/bootScreen.dart';
import '../view/Home/homeSreen.dart';
import '../view/Layout/layoutScreen.dart';
import '../view/Login/loginScreen.dart';



// 路由模块获取，以及获取传递参
// 初始广告页
var bootHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print(params);
    // Application.router.navigateTo(context, path)
    return new BootScreen();
  }
);

// 选择登录方式首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print(params);
    // Application.router.navigateTo(context, path)
    return new HomeScreen();
  }
);

// 页面首页
var layoutHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print(params);
    // Application.router.navigateTo(context, path)
    return new LayoutScreen();
  }
);

// 登录页
var loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print(params);
    // Application.router.navigateTo(context, path)
    return new LoginScreen();
  }
);



// var webViewHandler = new Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//     //获取路由跳转传来的参数
//     print(params);
//     return SearchScreen();
//   }
// );


// var homePageSreen = new Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//     //获取路由跳转传来的参数
//     print(params);
//     return HomePageSreen();
//   }
// );

// var songlistdetailsScreen = new Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//     //获取路由跳转传来的参数
//     // print(params['id'][0]);
//     return SongListDetails(id: params['id'][0].toString());
//   }
// );

// var musicpalyerScreen = new Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//     //获取路由跳转传来的参数
//     print(params['id'][0].toString());
//     return MusicPlaayerSreens(id: params['id'][0].toString());
//   }
// );