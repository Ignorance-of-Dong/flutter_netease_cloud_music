/*
 * @Author: zhangzheng
 * @Date: 2020-05-08 17:22:12
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-19 15:04:30
 * @Descripttion: 发现模块
 */
import "package:flutter/material.dart";
// import "package:cloudmusic/widgets/tabSwitching.dart";
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cloudmusic/utils/IconFont.dart';
import 'package:provider/provider.dart';
import 'package:cloudmusic/model/model.dart';

class FindScreen extends StatefulWidget {
  @override
  _FindScreenState createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  List<Widget> imageList = List();
  List navList = [
    {
      "title": "每日推荐",
      "icon": IconFont.calendar1,
      "size": 30.0
    },
    {
      "title": "歌单",
      "icon": IconFont.songSheet1,
      "size": 40.0
    },
    {
      "title": "排行榜",
      "icon": IconFont.rankingList2,
      "size": 30.0
    },
    {
      "title": "电台",
      "icon": IconFont.radioStation1,
      "size": 30.0
    },
    {
      "title": "直播",
      "icon": IconFont.liveBroadcast,
      "size": 33.0
    },
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      Provider.of<CounterNotifier>(context).getBannerList(context);
    });
    imageList
    ..add(
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage('http://p1.music.126.net/QKao5d1VommOCSijeJPS6Q==/109951164997275229.jpg'),
            fit: BoxFit.cover
          )
        )
      )
    )
    ..add(
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage('http://p1.music.126.net/QKao5d1VommOCSijeJPS6Q==/109951164997275229.jpg'),
            fit: BoxFit.cover
          )
        )
      )
    )
    ..add(
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage('http://p1.music.126.net/QKao5d1VommOCSijeJPS6Q==/109951164997275229.jpg'),
            fit: BoxFit.cover
          )
        )
      )
    )
    ..add(
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage('http://p1.music.126.net/QKao5d1VommOCSijeJPS6Q==/109951164997275229.jpg'),
            fit: BoxFit.cover
          )
        )
      )
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
    width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.all(0.0),
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            height: 150,
            child: Swiper(
              itemCount: 4,
              itemBuilder: _bannerBuilder,
              controller: SwiperController(),
              scrollDirection: Axis.horizontal,
              autoplay: true,
              onTap: (index) => print('点击了第$index'),
            ),
          ),
          Container(
            height: 120.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _navLinkBuilder(context)
            ),
          ),
          Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin:EdgeInsets.only(left: 20.0),
                        child: Text(
                          "宝藏歌单，值得一听",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800
                          ),
                        ),
                      ),
                      Container(
                        margin:EdgeInsets.only(right: 20.0),
                        child: Text("查看更多"),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 3 - 20,
                        height: MediaQuery.of(context).size.width / 3 - 20,
                        color: Colors.red,
                        margin: EdgeInsets.only(left: 10.0),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3 - 20,
                        height: MediaQuery.of(context).size.width / 3 - 20,
                        margin: EdgeInsets.only(left: 10.0),
                        color: Colors.red,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3 - 20,
                        height: MediaQuery.of(context).size.width / 3 - 20,
                        color: Colors.red,
                        margin: EdgeInsets.only(left: 10.0),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3 - 20,
                        height: MediaQuery.of(context).size.width / 3 - 20,
                        color: Colors.red,
                        margin: EdgeInsets.only(left: 10.0),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 300.0,
            color: Colors.blue,
          ),
          Container(
            height: 300.0,
            color: Colors.yellow,
          )
        ],
      ), 
    );
  }
  Widget _bannerBuilder(BuildContext context, int index) {
    var bannerList = Provider.of<CounterNotifier>(context).bannerList;
    List<Widget> view = List();
    for(var i = 0; i < bannerList.length; i++){
      view
        ..add(
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(bannerList[i]['pic']),
                fit: BoxFit.cover
              )
            )
          )
        );
    }
    print(view[index]);
    return view[index] ?? Container();
  }
  List<Widget> _navLinkBuilder(BuildContext context) {
    List<Widget> view = List();
    for(var i = 0; i < navList.length; i++){
      view
        ..add(
          Container(
            height: 80.0,
            child: Column(
              children: <Widget>[
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle
                  ),
                  child: Icon(
                    navList[i]['icon'],
                    size: navList[i]['size'],
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Center(
                    child: Text(navList[i]['title']),
                  ),
                )
              ],
            ),
          ),
        );
    }
    return view;
  }
}
