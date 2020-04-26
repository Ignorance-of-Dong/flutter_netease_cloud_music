import '../api/index.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class CounterNotifier with ChangeNotifier {
  int _count = 0;
  List _activelist = List();
  var _activeDetails = {};

  int get count => _count;
  List get activelist => _activelist;
  dynamic get activeDetails => _activeDetails;

  increment() {
    _count++;
    notifyListeners();
  }
  getActiveList(context) async{
    var listm = await NetWorkList().apiActiveList(context: context);
    _activelist = listm['data']['data'];
    notifyListeners();
  }
  getActiveDetail(context, params) async{
    var listm = await NetWorkList().apiActiveDetail(context: context, params: params);
    _activeDetails = listm['data']['data'];
    notifyListeners();
  }
}