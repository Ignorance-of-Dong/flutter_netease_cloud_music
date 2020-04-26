import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../view//Boot/bootScreen.dart';
import '../view/Home/homeSreen.dart';
// import '../pages/sarch/search_screen.dart';
// import '../newPages/homepage/home_page_screen.dart';
// import '../newPages/songListDetails/song_list_details.dart';
// import '../newPages/musicPlayerStart/music_player_start.dart';



// 路由模块获取，以及获取传递参数
var bootHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print(params);
    // Application.router.navigateTo(context, path)
    return new BootScreen();
  }
);
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print(params);
    // Application.router.navigateTo(context, path)
    return new HomeScreen();
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