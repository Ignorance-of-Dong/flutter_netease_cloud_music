<!--
 * @Author: zhangzheng
 * @Date: 2020-04-26 15:13:33
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-04-26 17:32:17
 * @Descripttion: 开发时遇到问题 ----- 记录
 -->


 # 手动打开Drawer侧边栏？

> 解决：body 下 创建一个builder 【创建一个内部的BuildContext】

  body: Builder(
    builder: (BuildContext context) {
      return Container(
        color: Color(0xffe2e2e2),
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 5.0),
              color: Colors.white,
              // 子组件，在子组件中可以正常调用Scaffold.of()
              child: buildOpera(context), // 传递context
            ) 
          ],
        ),
      );
    },
  )

  Widget buildOpenDraw(BuildContext context) {
    return InkResponse(
      child: Icon(
        Icons.menu
      ),
      onTap: () {
        Scaffold.of(context).openDrawer();
      }
    );
  }

# 获取手机状态栏的高度

> final double statusBarHeight = MediaQuery.of(context).padding.top;

# flutter AppBar组件属性

> https://www.jianshu.com/p/2a84f7fc3be7