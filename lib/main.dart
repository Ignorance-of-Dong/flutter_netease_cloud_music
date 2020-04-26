import 'package:flutter/material.dart';

import './view/Boot/bootScreen.dart';

// import 'routes/application.dart';
// import 'routes/routes.dart';
import 'routes/navigatorUtil.dart';
import 'package:provider/provider.dart';
import './model/model.dart';


void main() {
  Histroy();
  runApp(MyAppState());
}

class MyAppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CounterNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // 取消右上角debug标志
        title: 'Fluter bottomnavagiter',
        theme: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
        ),
        home: BootScreen(),
      ),
    );
  }
}