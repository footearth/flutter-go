import 'package:flutter/material.dart' show
  Widget
, AppBar
, Text
, BuildContext
, IconButton
, Navigator
, ModalRoute
, Icon
, Icons

, PreferredSizeWidget
, StatelessWidget
, Size
, kToolbarHeight
;
import './PopupMenu.dart' show
  PopupMenu
;

class WidgetAppBar
extends StatelessWidget
implements PreferredSizeWidget 
{

  final String title
  ;
  final collectionIcons
  ;
  final Function getCollection
  ;
  final Function selectValue
  ;

  WidgetAppBar({
    this.title
  , this.collectionIcons
  , this.getCollection
  , this.selectValue
  })
  ;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title)
    , actions: <Widget>[
        IconButton(
          tooltip: 'goBack home'
        , onPressed: () {
            Navigator.popUntil(
              context
            , ModalRoute.withName('/')
            )
            ;
          }
        , icon: Icon(Icons.home)
        )
      , IconButton(
          tooltip: 'collection'
        , onPressed: getCollection
        , icon: Icon(collectionIcons)
        )
      , PopupMenu(selectValue)
      ]
    )
    ;
  }

  @override
  Size get preferredSize =>
    Size.fromHeight(kToolbarHeight)
  ;

}
