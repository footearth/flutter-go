import 'package:flutter/material.dart' show
  Widget
, SizedBox
;
import '../../components/markdown.dart' show
  MarkdownBody
;
import './Array.dart' show
  Array
;

List<Widget> buildContent(widget) {

  return Array(widget.contentList)
  .reduce(
    (r, c, _, __) {
      List<Widget> e
      ;
      if (c.runtimeType == String) {
        e = []
          ..add(MarkdownBody(c))
          ..add(SizedBox(
            height: 20.0
          ))
        ;
      } else {
        e = [] 
          ..add(c)
        ;
      }
      return []
        ..addAll(r)
        ..addAll(e)
      ;
    }
  , [
    SizedBox(
      height: 10.0
    )
  ]
  )
  .cast<Widget>()
  ;

}
