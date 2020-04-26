import './application.dart';
import './routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

// 对路由进一步封装
class Histroy {
  void ininState(){
    Router router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  push({context, path, clearStack = false}) {
    ininState();
    return Application.router.navigateTo(
      context, 
      path,
      transition: TransitionType.inFromRight,
      clearStack: clearStack
    );
  }
  pop(context) {
    Navigator.of(context).pop(context);
  }
}