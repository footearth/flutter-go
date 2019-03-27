import 'package:flutter/material.dart' show
  StatelessWidget
, Widget

, BuildContext  

, Scaffold
, Container
, AppBar
, Text
;

class WidgetNotFound extends StatelessWidget {

  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text( "widget not found" )
    )
  , body: Container(
      child: Text( "widget not found" )
    )
  )
  ;

}
