import 'package:flutter/material.dart' show
  PopupMenuButton
, BuildContext
, PopupMenuEntry
, PopupMenuItem
, ListTile
, Icon
, Icons
, Text
, PopupMenuDivider 
, StatelessWidget
, Widget
; 

class PopupMenu
extends StatelessWidget
{
  final Function selectValue
  ;

  PopupMenu(this.selectValue)
  ;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: selectValue
    , itemBuilder: (BuildContext context) =>
        <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'doc'
          , child: ListTile(
              leading: Icon(
                Icons.library_books
              , size: 22.0
              )
            , title: Text('查看文档')
            )
          )
        , const PopupMenuDivider()
        , const PopupMenuItem<String>(
            value: 'code'
          , child: ListTile(
              leading: Icon(
                Icons.code
              , size: 22.0
              )
            , title: Text('查看Demo')
            )
          )
        ]
    )
    ;
  }
}
