/// @Author: 一凨 
/// @Date: 2018-12-27 16:25:22 
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-27 16:35:39

import 'package:flutter/material.dart' show
  StatefulWidget
, State
, Widget
, BuildContext
;
import '../../../../components/widget_demo/index.dart' show
  WidgetDemo
;
import './demo.dart' show
  MaterialButtonDemo
;

const String content0 = '''
### **简介**
> 用于构建一个依赖于 ButtonThem 和 Theme 的按钮 widget
- 如果有必要，按钮的大小是自是适配于其子 widget 的
- 最好不要直接使用这个 widget，而应该可以考虑使用 FlatButton、OutlineButton 或者 RaiseButton,他们包含一些和主题风格相适配的一些基础样式
- 如果要直接创建按钮而不继承主题默认值，可以考虑使用 RawMaterialButton
- 如果想使用 ink-splash 的效果但是又不想使用 button，可以考虑使用 InkWell
'''
;
const String content1 = '''
### **基本用法**
> 尽量不要直接使用 MaterialButton
- 如果 MaterialButton 上的 onPress 为 null，则按钮处于被禁用状态
- IconButton 可以创建一些带有 图标的按钮
'''
;

class Demo extends StatefulWidget {

  static const String routeName =
    '/themes/Material/MaterialButton'
  ;

  _DemoState createState() => _DemoState()
  ;
}

class _DemoState extends State<Demo> {

  @override
  Widget build(BuildContext context) =>
    WidgetDemo(
      contentList: [
        content0
      , content1
      , MaterialButtonDemo()
      ]
    , title: 'MaterialButton'
    , codeUrl: 'themes/Material/MaterialButton/demo.dart'
    , docUrl:
        'https://docs.flutter.io/flutter/material/MaterialButton-class.html'
    )
  ;

}
