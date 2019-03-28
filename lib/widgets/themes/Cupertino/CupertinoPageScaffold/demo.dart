/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/20
/// Time: 上午11:34
/// email: zhu.yan@alibaba-inc.com
/// target: CupertinoPageScaffold 的示例

import 'package:flutter/material.dart' show
  StatefulWidget
, State
, Widget
, BuildContext 
, SizedBox
, MediaQuery
, Icon
, Text
, Center
, TextStyle
, Colors
;
import 'package:flutter/cupertino.dart' show
  CupertinoPageScaffold
, CupertinoColors
, CupertinoNavigationBar
, CupertinoIcons
;

// CupertinoPageScaffold 默认的实例
class CupertinoPageScaffoldFullDefault extends StatefulWidget {
  const CupertinoPageScaffoldFullDefault()
  : super()
  ;

  @override
  State<StatefulWidget> createState() =>
    _CupertinoPageScaffoldFullDefault()
  ;
}

// CupertinoPageScaffold 默认的实例,有状态
class _CupertinoPageScaffoldFullDefault extends State {

  @override
  Widget build(BuildContext context) =>
    SizedBox(
      height:
        MediaQuery.of(context)
        .size.height/1.5
      , child: navigationBar(context)
    )
  ;

  Widget navigationBar(BuildContext context) =>
    // 进入程序后显示的第一个页面,传入的是一个Widget
    // 但实际上这个Widget需要包裹一个Scaffold
    CupertinoPageScaffold(
      // 整个脚手架下面的 widget 的颜色
      backgroundColor: CupertinoColors.inactiveGray
    , navigationBar: CupertinoNavigationBar(
        // 放置在导航栏的开头。通常是正常页面的后退按钮或完整页面对话框的取消按钮
        leading: Icon(CupertinoIcons.back)
      , // 放置在导航栏的中间。通常是标题或分段控件
        middle: Text('这里是标题')
      , // 放置在导航栏的末尾。通常在页面上执行其他操作，例如搜索或编辑功能
        trailing: Icon(CupertinoIcons.share)
      )
    , child: Center(
        child: Text(
          '这里是内容'
        , style: TextStyle(
            color: Colors.black
          )
        )
      )
      // 应用程序默认路由,（Navigator.defaultRouteName，即/）
    , // child 是否应该调整自己的大小以避免窗口的底部插入
      resizeToAvoidBottomInset:false
    )
  ;

}
