/*
 * @Author: zhangzheng
 * @Date: 2020-04-26 18:15:19
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-04-30 15:16:30
 * @Descripttion: 文本输入框 --- 支持多类型
 */
import "package:flutter/material.dart";

/*
 * @params type 输入框类型
 * @params onChange 输入框事件
 * @params value 输入框的值
 * @params formKey 针对form表单的校验 --- 如果有校验则必须传
 * @params rules 针对校验的规则
 * @params errorTip 针对校验规则出现错误的提示
 * @params isRequest 是否必填
 * @params requestTip 输入框不为空提示文案
 * @params placeholder ==================
 */

class InputForm extends StatefulWidget {
  final type;
  final onChange;
  final value;
  final formKey;
  final isRules;
  final rules;
  final errorTip;
  final isRequest;
  final requestTip;
  final placeholder;
  InputForm({
    Key key,
    this.type,
    this.value,
    this.rules,
    this.isRules,
    this.onChange,
    this.formKey,
    this.errorTip,
    this.isRequest,
    this.requestTip,
    this.placeholder
  }):super(key: key);
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  String type;
  Function onChange;
  TextEditingController value = TextEditingController();
  RegExp rules;
  var _formKey;
  String errorTip = "无法通过规则校验";
  String requestTip = "输入框不能为空";
  String placeholder = "请输入";
  bool isRequest = false;
  bool isRules = false;
  @override
  void initState() {
    this.type = widget.type ?? this.type;
    this.value = widget.value ?? this.value;
    this.onChange = widget.onChange ?? this.onChange;
    this.rules = widget.rules ?? this.rules;
    this._formKey = widget.formKey ?? GlobalKey<FormState>();
    this.errorTip = widget.errorTip ?? this.errorTip;
    this.isRequest = widget.isRequest ?? this.isRequest;
    this.requestTip = widget.requestTip ?? this.requestTip;
    this.isRules = widget.isRules ?? this.isRules;
    this.placeholder = widget.placeholder ?? this.placeholder;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            obscureText: type == 'password' ? true : false,
            controller: value,
            decoration: InputDecoration(
              hintText: placeholder,
            ),
            validator: (value) {
              if (isRequest && value.isEmpty) {
                return requestTip;
              }
              if (isRules && !rules.hasMatch(value)) {
                return errorTip;
              }
              return null;
            },
            onChanged: (value) {
              onChange(value);
            },
          )
        ],
      ),
    );
  }
}