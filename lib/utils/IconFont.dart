/*
 * @Author: zhangzheng
 * @Date: 2020-05-18 15:16:06
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-19 11:24:41
 * @Descripttion: iconfont 图标
 */ 

// function camelCase(str) {
//   return str.replace(/[ -]+(\w)/g, (match, char) => char.toUpperCase());
// }

// function makeCode({name, code}) {
//   return `static const IconData ${camelCase(name)} = IconData(0${code.substr(2, 5)}, fontFamily: 'myIcon');\n`;
// }
// let font = Array.from(document.querySelectorAll('.symbol .dib'))
// Array
//   .from(document.querySelectorAll('.unicode .dib'))
//   .map((element, index) => {
//     return {
//       name: font[index].querySelector('.code-name').innerText.split('#icon-')[1],
//       code: element.querySelector('.code-name').innerText
//     };
//   })
//   .map(makeCode)
//   .join('\n');


import 'package:flutter/material.dart';

class IconFont {
static const IconData smallBell = IconData(0xe717, fontFamily: 'myIcon');

static const IconData scan = IconData(0xe613, fontFamily: 'myIcon');

static const IconData alarmClock = IconData(0xe614, fontFamily: 'myIcon');

static const IconData microphone = IconData(0xe600, fontFamily: 'myIcon');

static const IconData skinPeeler = IconData(0xe686, fontFamily: 'myIcon');

static const IconData user = IconData(0xe604, fontFamily: 'myIcon');

static const IconData ticket = IconData(0xe75e, fontFamily: 'myIcon');

static const IconData alarmClock1 = IconData(0xe601, fontFamily: 'myIcon');

static const IconData collection = IconData(0xe61c, fontFamily: 'myIcon');

static const IconData nearby = IconData(0xe75b, fontFamily: 'myIcon');

static const IconData timing = IconData(0xe606, fontFamily: 'myIcon');

static const IconData smallBell1 = IconData(0xe7e6, fontFamily: 'myIcon');

static const IconData letter = IconData(0xe60a, fontFamily: 'myIcon');

static const IconData rankingList = IconData(0xe7bd, fontFamily: 'myIcon');

static const IconData liveBroadcast = IconData(0xe727, fontFamily: 'myIcon');

static const IconData radioStation = IconData(0xe65e, fontFamily: 'myIcon');

static const IconData rankingList1 = IconData(0xe609, fontFamily: 'myIcon');

static const IconData radioStation1 = IconData(0xe602, fontFamily: 'myIcon');

static const IconData radioStation2 = IconData(0xe603, fontFamily: 'myIcon');

static const IconData rankingList2 = IconData(0xe7e5, fontFamily: 'myIcon');

static const IconData rankingList3 = IconData(0xe605, fontFamily: 'myIcon');

static const IconData calendar = IconData(0xe607, fontFamily: 'myIcon');

static const IconData calendar1 = IconData(0xe62c, fontFamily: 'myIcon');

static const IconData songSheet = IconData(0xe608, fontFamily: 'myIcon');

static const IconData liveBroadcast1 = IconData(0xe60b, fontFamily: 'myIcon');

static const IconData songSheet1 = IconData(0xe636, fontFamily: 'myIcon');
}