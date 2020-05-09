/*
 * @Author: zhangzheng
 * @Date: 2020-05-08 18:02:58
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-09 16:18:50
 * @Descripttion: tab切换组件 == === == = == == = 仿tabbar切换动画 -==== 构思中
 */
import "package:flutter/material.dart";
import "package:flutter/animation.dart";
import 'package:cloudmusic/widgets/gradientButton.dart';

class TabSwitching extends StatefulWidget {
  final context;
  TabSwitching({
    Key key,
    @required this.context
  }): super(key: key);
  @override
  _TabSwitchingState createState() => _TabSwitchingState();
}

class _TabSwitchingState extends State<TabSwitching> with TickerProviderStateMixin{

  var w = 100.0;
  var h = 100.0;


  Animation<double> animation;
  AnimationController animationController;
  BuildContext context;

  @override
  void initState() {
      super.initState();
      // 创建 AnimationController，用于控制动画
      // 必须提供动画时间
      context = widget.context ?? this.context;
      animationController = new AnimationController(vsync: this,duration: Duration(milliseconds: 1500));
      // 创建一个插值器，关联 AnimationController，返回一个新的 Animation 对象
      runAnimation(MediaQuery.of(context).size.width, 0, 0);
  }

  runAnimation(screenWid, start, end) {
    print(start);
    // 0, 1
    // 1, 2
    // 2, 1
    animation = Tween<double>(begin: screenWid * start, end: start * end).animate(animationController);

      animationController.addListener((){
        print("正在执行动画化");
        setState(() {
        });
      });
      // 开始播放动画
      animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 2,
                color: Colors.lightBlue,
                margin: EdgeInsets.only(right: animation.value),
              )
            ),
            GradientButton(
              context: context, 
              text: "hahah",
              handelClick: () {
                runAnimation(MediaQuery.of(context).size.width, 0, 1);
              }
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // 动画使用完成后必需要销毁
    animationController.dispose();
  }
}