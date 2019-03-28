/// Created with Android Studio.
/// User: 三帆
/// Date: 20/01/2019
/// Time: 22:28
/// email: sanfan.hx@alibaba-inc.com
/// target:  CupertinoTabBar

import 'package:flutter/material.dart' show
  StatefulWidget
, State 
, Widget
, BuildContext
, Container
, Scaffold
, AppBar
, Text
, FloatingActionButtonLocation
, Center
, Color
, BottomNavigationBarItem
, Icon
, Icons
;
import 'package:flutter/cupertino.dart' show
  CupertinoTabBar
;

class CupertinoTabBarDemo extends StatefulWidget {
  _Demo createState() =>
    _Demo()
  ;
}

class _Demo extends State<CupertinoTabBarDemo> {

  int index = 0
  ;

  changeIndex(int _index) {
    this.setState(() {
      index = _index
      ;
    }
    )
    ;
  }

  Widget build(BuildContext context) =>
    Container(
      height: 500
    , child: Scaffold(
        appBar: AppBar(
          title: const
            Text('CupertinoTabBarDemo')
        )
      , floatingActionButtonLocation:
          FloatingActionButtonLocation
          .centerDocked
      , body: Center(
          child: Text('CupertinoTabBarDemo in bottom')
        )
      , bottomNavigationBar: CupertinoTabBar(
          backgroundColor: Color.fromRGBO(
            244, 244, 244, 0.5
          )
        , currentIndex: index
        , onTap: (i) {
            this.changeIndex(i)
            ;
          }
        , items: [
            BottomNavigationBarItem(
              title: Text("1")
            , icon: Icon(Icons.add)
            )
          , BottomNavigationBarItem(
              title: Text("2")
            , icon: Icon(Icons.delete)
            )
          ]
        )
      )
    )
  ;

}
