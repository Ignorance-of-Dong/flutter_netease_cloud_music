// import 'dart:async';
import 'package:flutter/material.dart';
// import 'dart:convert';
import '../server/request.dart';

class NetWorkList{
  /// 获取banner图
  apiActiveList({
    @required context,
    params
  }){
    return HttpsResponse(context).post('/default/getArticleList');
  }

  /// 获取推荐歌单
  apiActiveDetail({
    @required context,
    params
  }){
    print(params);
    return HttpsResponse(context).post('/default/getArticlesDetail?activeid=${params['id']}');
  }

  /// 获取新碟
  apialbums({
    @required context,
    params
  }){
    return HttpsResponse(context).post('/top/album?limit=${params['limit']}');
  }

  /// 获取歌单详情
  apiplaylistDetail({
    @required context,
    params
  }){
    return HttpsResponse(context).post('/playlist/detail?id=${params['id']}');
  }
  /// 获取歌曲地址
  apisongurl({
    @required context,
    params
  }){
    return HttpsResponse(context).post('/song/url?id=${params['id']}');
  }
  /// 获取歌曲详情
  apisongdetail({
    @required context,
    params
  }){
    return HttpsResponse(context).post('/song/detail?ids=${params['id']}');
  }}