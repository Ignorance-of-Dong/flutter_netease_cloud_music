/*
 * @Author: zhangzheng
 * @Date: 2020-04-17 13:58:20
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-19 12:06:06
 * @Descripttion: dio请求方法
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../widgets/requestLoading.dart';
import 'package:toast/toast.dart';

class HttpsResponse {
  static HttpsResponse instance;
  static BuildContext context;
  Dio dio;
  BaseOptions options;
  static HttpsResponse getInstance() {
    if (null == instance) instance = new HttpsResponse(context);
    return instance;
  }

  // 或者通过传递一个 `options`来创建dio实例
  HttpsResponse(context) {
    options = BaseOptions(
      baseUrl: "http://musicapi.ignorantscholar.cn/",
      connectTimeout: 15000,
      receiveTimeout: 15000,
      responseType: ResponseType.plain,
      // validateStatus: (status) {
      //   // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
      //   return true;
      // },
    );
    dio = new Dio(options);
    //添加拦截器
    LoadingPage loadingPage = LoadingPage(context);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("请求之前");

      loadingPage.show();
      // Future.delayed(
      //   Duration(seconds: 3),
      //   () {
      //     loadingPage.close();
      //   },
      // );
      // return options;
    }, onResponse: (Response response) {
      // LoadingPage loadingPage = LoadingPage(context);
       print("响应之前");
      loadingPage.close();
      // BotToast.showText(text:"xxxx");  //popup a text toast;
      // showToast('11111',
      //   position:ToastPosition.bottom
      // );
      Toast.show("Success", context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM,
          backgroundRadius: 4.0);
     
      return response;
    }, onError: (DioError e) {
      print("错误之前");
      loadingPage.close();
      // showToast('11111',
      //   position:ToastPosition.bottom
      // );
      // showToast("content");
      Toast.show("Error", context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM,
          backgroundRadius: 4.0);
      
      return e;
    }));
  }

  static Response response;

  Object get(url) async {
    response = await dio.get(url);
    // print(response.toString());
    // return response;
    return response;
  }
  String result;
  Object post(url) async {
    print(url);
    try {
      response = await dio.post(url);
      // print(response);
      // print(response.toString());
      // return response;
      // var data = jsonDecode(response.toString());
      var data = json.decode(response.toString());
      // var newDate = response.toString();
      // var ip = Ip.fromJson(response);//1
      // result = ip.origin;
      return data;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
