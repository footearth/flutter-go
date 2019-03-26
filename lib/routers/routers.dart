import 'package:fluro/fluro.dart' show
  Router
, Handler
;
import 'package:flutter/material.dart' show
  BuildContext
;

import '../widgets/index.dart' show
  WidgetDemoList
;
import './router_handler.dart' show
  homeHandler
, categoryHandler
, widgetNotFoundHandler
, fullScreenCodeDialog
, webViewPageHand
;

class Routes {

  static String root = "/"
  ;
  static String home = "/home"
  ;
  static String widgetDemo = '/widget-demo'
  ;
  static String codeView = '/code-view'
  ;
  static String webViewPage = '/web-view-page'
  ;

  static void configureRoutes(Router router) {

    List widgetDemosList = WidgetDemoList().getDemos()
    ;

    router.notFoundHandler = Handler(
      handlerFunc: (
        BuildContext context
      , Map<String
      , List<String>> params
      ) {}
    )
    ;

    router.define(
      home
    , handler: homeHandler
    )
    ;
    router.define(
      '/category/:type'
    , handler: categoryHandler
    )
    ;
    router.define(
      '/category/error/404'
    , handler: widgetNotFoundHandler
    )
    ;
    router.define(
      codeView
    , handler: fullScreenCodeDialog
    )
    ;
    router.define(
      webViewPage
    , handler: webViewPageHand
    )
    ;

    widgetDemosList.forEach( (demo) {
      Handler handler = Handler(
        handlerFunc: (
          BuildContext context
        , Map<String
        , List<String>> params
        ) => demo.buildRouter( context )
      )
      ;
      router.define(
        '${demo.routerName}'
      , handler: handler
      )
      ;
    }
    )
    ;

  }
}
