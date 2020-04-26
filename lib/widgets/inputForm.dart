/*
 * @Author: zhangzheng
 * @Date: 2020-04-26 18:15:19
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-04-26 19:00:20
 * @Descripttion: 文本输入框 --- 支持多类型
 */
import "package:flutter/material.dart";


class InputForm extends StatefulWidget {
  final type;
  final onChange;
  final value;
  InputForm({
    Key key,
    this.type,
    this.value,
    this.onChange,
  }):super(key: key);
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  String type;
  Function onChange;
  TextEditingController value = TextEditingController();
  @override
  void initState() {
    this.type = widget.type ?? this.type;
    this.value = widget.value ?? this.value;
    this.onChange = widget.onChange ?? this.onChange;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: type == 'password' ? true : false,
      controller: value,
      onChanged: (value) {
        onChange(value);
      },
    );
  }
}