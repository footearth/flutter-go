import 'package:flutter/material.dart' show
  StatelessWidget
, Widget

, BuildContext
, MaterialApp
, Scaffold

, runApp

, ThemeData
, IconThemeData
, TextTheme
, TextStyle
, Color
;
import 'package:fluro/fluro.dart' show
  Router
;
import 'package:flutter_go/routers/routers.dart' show
  Routes
;
import 'package:flutter_go/utils/provider.dart' show
  Provider
;
import 'routers/application.dart' show
  Application
;
import 'utils/shared_preferences.dart' show
  SpUtil
;
import 'views/first_page/home.dart' show
  AppPage
;
import 'package:flutter_go/model/search_history.dart' show
  SearchHistoryList
;
//import 'views/welcome_page/index.dart';

const int ThemeColor = 0xFFC91B3A
;
SpUtil sp
;
var db
;

class MyApp extends StatelessWidget {

  MyApp()  {
    final router = new Router()
    ;
    Routes.configureRoutes( router )
    ;
    Application.router = router
    ;
  }

  showWelcomePage() => AppPage()
  ;
  // 暂时关掉欢迎介绍
  //    bool showWelcome = sp.getBool(SharedPreferencesKeys.showWelcome);
  //    if (showWelcome == null || showWelcome == true) {
  //      return WelcomePage();
  //    } else {
  //      return AppPage();
  //    }

  @override
  Widget build(BuildContext context) =>

    new MaterialApp(

      title: 'title'

    , theme: new ThemeData(

        primaryColor: Color( ThemeColor )
      , backgroundColor: Color( 0xFFEFEFEF )
      , accentColor: Color( 0xFF888888 )

      , textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(
            color: Color( 0xFF888888 )
          , fontSize: 16.0
          )
        )
      , iconTheme: IconThemeData(
          color: Color( ThemeColor )
        , size: 35.0
        )
      )

    , home: new Scaffold(
        body: showWelcomePage()
      )

    , onGenerateRoute: Application.router.generator

    )
    ;

}

void main() async {

  final provider = new Provider()
  ;
  await provider.init( true )
  ;

  sp = await SpUtil.getInstance()
  ;
  new SearchHistoryList( sp )
  ;

  db = Provider.db
  ;

  runApp( new MyApp() )
  ;
}
