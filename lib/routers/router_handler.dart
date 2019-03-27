import 'package:flutter/material.dart' show
  BuildContext
;
import 'package:fluro/fluro.dart' show
  Handler
;

import '../components/category.dart' show
  CategoryHome
;
import '../components/full_screen_code_dialog.dart' show
  FullScreenCodeDialog
;
import '../views/web_page/web_view_page.dart' show
  WebViewPage
;
import '../views/first_page/home.dart' show
  AppPage
;
import '../widgets/404.dart' show
  WidgetNotFound
;

// app的首页
var homeHandler = Handler(
  handlerFunc: (
    BuildContext context
  , Map<
      String
    , List<String>
    > params
  ) => AppPage()
)
;

var categoryHandler = Handler(
  handlerFunc: (
    BuildContext context
  , Map<
      String
    , List<String>
    > params
  ) {
    String name = params["type"]?.first
    ;
    return CategoryHome(name)
    ;
  }
)
;

var fullScreenCodeDialog = Handler(
  handlerFunc: (
    BuildContext context
  , Map<
      String
    , List<String>
    > params
  ) {
    String path = params['filePath']?.first
    ;
    return FullScreenCodeDialog(
      filePath: path
    )
    ;
  }
)
;

var webViewPageHand = Handler(
  handlerFunc: (
    BuildContext context
  // , params
  , Map<
      String
    , List<String>
    > params
  ) {
    String title = params['title']?.first
    ;
    String url = params['url']?.first
    ;
    return WebViewPage(url, title)
    ;
  }
)
;

var widgetNotFoundHandler = Handler(
  handlerFunc: (
    BuildContext context
  , Map<
      String
    , List<String>
    > params
  ) => WidgetNotFound()
)
;
