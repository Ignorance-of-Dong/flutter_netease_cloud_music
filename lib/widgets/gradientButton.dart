/*
 * @Author: zhangzheng
 * @Date: 2020-04-24 19:03:38
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-25 12:01:41
 * @Descripttion: 水波纹按钮
 */
import 'package:flutter/material.dart';
import 'package:cloudmusic/utils/lcfarmSize.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
 * @params context 当前容器 【必传】
 * @params color 按钮颜色
 * @params text 按钮文本
 * @params handelClick 按钮事件
 * @params textColor 按钮文本颜色
 * @params fontSize 按钮字体大小
 * @params borderRadius 圆角弧度
 * @params borderColor 按钮边框夜色
 * */
class GradientButton extends StatefulWidget {
  final contextcolor;
  final context;
  final handelClick;
  final text;
  final textColor;
  final fontSize;
  final borderRadius;
  final borderColor;
  GradientButton({
    Key key,
    @required this.context,
    @required this.handelClick,
    this.contextcolor,
    this.text,
    this.textColor,
    this.fontSize,
    this.borderRadius,
    this.borderColor,
  }): super(key: key);
  @override
  _GradientButtonState createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {

  Color contextcolor = Colors.white;
  Color textColor = Colors.black;
  Color borderColor = Colors.white;
  BuildContext context;
  Function handelClick;
  String text = "";
  double fontSize;
  double borderRadius;
  @override
  void initState() {
    this.contextcolor = widget.contextcolor ?? this.contextcolor;
    this.context = widget.context ?? this.context;
    LcfarmSize.getInstance().init(context);
    this.handelClick = widget.handelClick ?? this.handelClick;
    this.text = widget.text ?? this.text;
    this.textColor = widget.textColor ?? this.textColor;
    this.fontSize = widget.fontSize ?? 60;
    this.borderRadius = widget.borderRadius ?? 20;
    this.borderColor = widget.borderColor ?? this.borderColor;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1242, height: 2688, allowFontScaling: true);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: ScreenUtil().setWidth(3)),
        color: contextcolor,
        borderRadius: BorderRadius.circular(25)
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        color: Colors.transparent, // 设为透明色
        elevation: 0, // 正常时阴影隐藏
        highlightElevation: 0, // 点击时阴影隐藏
        onPressed: handelClick,
        child: Container(
          alignment: Alignment.center,
          height: ScreenUtil().setHeight(100),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: ScreenUtil().setSp(fontSize)),
          ),
        ),
      ),
    );
  }
}
