import 'dart:async' show
  Future
;
import 'package:flutter/material.dart' show
  State
, Widget
, StatefulWidget 
, BuildContext

, EdgeInsets
, DecorationImage
, BoxDecoration
, Container
, AppBar
, ListView
, Scaffold
, WillPopScope
, Text
, AssetImage

, Colors
, Alignment
;

import '../routers/application.dart' show
  Application
;
import '../model/cat.dart' show
  Cat
, CatControlModel
;
import '../model/widget.dart' show
  WidgetPoint
, WidgetControlModel
;
import '../widgets/index.dart' show
  WidgetDemoList 
;
import '../components/widget_item_container.dart' show
  WidgetItemContainer
;

enum CateOrWigdet {
  Cat
, WidgetDemo
}

class CategoryHome extends StatefulWidget {

  CategoryHome(this.name)
  ;
  final String name
  ;

  @override
  _CategoryHome createState() => new _CategoryHome()
  ;

}

class _CategoryHome extends State<CategoryHome> {
  String title = ''
  ;
  // 显示列表 cat or widget;
  List<Cat> categories = []
  ;
  List<WidgetPoint> widgetPoints = []
  ;
  List<Cat> catHistory = List()
  ;

  CatControlModel catControl = CatControlModel()
  ;
  WidgetControlModel widgetControl = WidgetControlModel()
  ;

  // 所有的可用demos;
  List widgetDemosList = WidgetDemoList().getDemos()
  ;

  @override
  void initState() {
    super.initState()
    ;
    // 初始化加入顶级的name
    this.getCatByName(widget.name)
    .then( (
      Cat cat
    ) {
      catHistory.add(cat)
      ;
      searchCatOrWigdet()
      ;
    }
    )
    ;
  }

  Future<Cat> getCatByName(
    String name
  ) async =>
    await catControl.getCatByName(name)
  ;

  Future<bool> back() {
    if (catHistory.length == 1) {
      return Future<bool>.value(true)
      ;
    }
    catHistory.removeLast()
    ;
    searchCatOrWigdet()
    ;
    return Future<bool>.value(false)
    ;
  }

  void go(
    Cat cat
  ) {
    catHistory.add(cat)
    ;
    searchCatOrWigdet()
    ;
  }

  void searchCatOrWigdet() async {
    // 假设进入这个界面的 parent 一定存在
    Cat parentCat = catHistory.last
    ;

    // 继续搜索显示下一级 depth: depth + 1, parentId: parentCat.id
    List<Cat> _categories =
      await catControl.getList(new Cat(parentId: parentCat.id))
    ;
    List<WidgetPoint> _widgetPoints = List()
    ;
    if (_categories.isEmpty) {
      _widgetPoints =
        await widgetControl.getList(
          WidgetPoint(
            catId: parentCat.id
          )
        )
      ;
    }

    this.setState( () {
      categories = _categories
      ;
      title = parentCat.name
      ;
      widgetPoints = _widgetPoints
      ;
    }
    )
    ;
  }

  void onCatgoryTap(
    Cat cat
  ) => go(cat)
  ;

  void onWidgetTap(
    WidgetPoint widgetPoint
  ) {
    String targetName = widgetPoint.name
    ;
    String targetRouter = '/category/error/404'
    ;
    widgetDemosList.forEach( (item) {
      // print("targetRouter = item.routerName> ${[item.name,targetName]}");
      if (item.name == targetName) {
        targetRouter = item.routerName
        ;
      }
    }
    )
    ;
    Application.router.navigateTo(
      context, "$targetRouter"
    )
    ;
  }

  Widget _buildContent() {
    WidgetItemContainer wiContaienr =
      WidgetItemContainer(
        columnCount: 3
      , categories: categories
      , isWidgetPoint:false
      )
    ;
    if (widgetPoints.length > 0) {
      wiContaienr = WidgetItemContainer(
        categories: widgetPoints
      , columnCount: 3
      , isWidgetPoint:true
      )
      ;
    }
    return Container(
      padding: const EdgeInsets.only(
        bottom: 10.0
      , top: 5.0
      )
    , decoration: BoxDecoration(
        color: Colors.white
      , image: DecorationImage(
          image: AssetImage(
            'assets/images/paimaiLogo.png'
          )
        , alignment: Alignment.bottomRight
        )
      )
    , child: wiContaienr
    )
    ;
  }

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      appBar: AppBar(
        title: Text( title )
      )
    , body: WillPopScope(
        onWillPop: () => back()
      , child: ListView(
          children: <Widget>[
            _buildContent()
          ]
        )
        // child: Container(color: Colors.blue,child: Text('123'),),
      )
    )
  ;
}
