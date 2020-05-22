/*
 * @Author: zhangzheng
 * @Date: 2020-05-08 17:22:12
 * @LastEditors: zhangzheng
 * @LastEditTime: 2020-05-22 18:16:25
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
  List<Widget> rowColumnList = List();
  List navList = [
    {
      "title": "每日推荐",
      "icon": IconFont.calendar1,
      "size": 24.0
    },
    {
      "title": "歌单",
      "icon": IconFont.songSheet,
      "size": 26.0
    },
    {
      "title": "排行榜",
      "icon": IconFont.rankingList1,
      "size": 26.0
    },
    {
      "title": "电台",
      "icon": IconFont.radioStation1,
      "size": 26.0
    },
    {
      "title": "直播",
      "icon": IconFont.liveBroadcast,
      "size": 33.0
    },
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) async{
      await Provider.of<CounterNotifier>(context).getBannerList(context);
      await Provider.of<CounterNotifier>(context).getRecommendedSongList(context, {"limit": 6});
      await Provider.of<CounterNotifier>(context).getTopList(context, {"id": 25});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List songList = Provider.of<CounterNotifier>(context).recommendedSongList;
    List djList = Provider.of<CounterNotifier>(context).djList;
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
            height: 250.0,
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
                  child: Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _songListBuilder(context, songList)
                    )
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 350.0,
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
                          "百听不厌的电音神曲",
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
                Container(
                  height: 260,
                  child: Swiper(
                    itemWidth: MediaQuery.of(context).size.width,
                    itemHeight: 260.0,
                    itemCount: djList.length > 1 ? djList.length : 3,
                    itemBuilder: _rowColumnInd,
                    customLayoutOption: new CustomLayoutOption(
                        startIndex: -1,
                        stateCount: 3
                    ).addTranslate([
                        new Offset(-(MediaQuery.of(context).size.width), -0.0),
                        new Offset(0.0, 0.0),
                        new Offset(MediaQuery.of(context).size.width - 30, -0.0),
                    ]),
                    controller: SwiperController(),
                    scrollDirection: Axis.horizontal,
                    layout: SwiperLayout.CUSTOM,
                    onTap: (index) => print('点击了第$index'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 300.0,
            color: Colors.yellow,
          )
        ],
      ), 
    );
  }
  
  Widget _rowColumnInd(BuildContext context, int index) {
    List<Widget> dj = [
      Container(
        width: MediaQuery.of(context).size.width - 50,
        margin: EdgeInsets.only(left: 10.0),
      ),
      Container(
        width: MediaQuery.of(context).size.width - 50,
        margin: EdgeInsets.only(left: 10.0),
      ),
      Container(
        width: MediaQuery.of(context).size.width - 50,
        margin: EdgeInsets.only(left: 10.0),
      )
    ];
    List djList = Provider.of<CounterNotifier>(context).djList;
    print(djList.length);
    print(index);
    return djList.length > 1 ? djList[index] : dj[index];
  }
  List<Widget> _songListBuilder(BuildContext context, songList) {
    List<Widget> view = List();
    for(var i = 0; i < songList.length; i++){
      view
        ..add(
          Container(
            margin: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.width / 3 + 30,
            width: MediaQuery.of(context).size.width / 3 - 20,
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width / 3 - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(songList[i]['picUrl']),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Container(
                  child: Text(
                    songList[i]['name'],
                    softWrap: true,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2
                  )
                )
              ]
            ),
          )
        );
    }
    return view;
  }
  Widget _bannerBuilder(BuildContext context, int index) {
    var bannerList = Provider.of<CounterNotifier>(context).bannerList;
    Widget defaultTempalate = Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage('http://p1.music.126.net/eBn9D-_0-w0MuoUJajHk0w==/109951165001935889.jpg'),
          fit: BoxFit.cover
        )
      )
    );
    return bannerList.length > 1 ? bannerList[index] : defaultTempalate;
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
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color.fromRGBO(236, 127, 127, 1), Colors.red]
                    ),
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
