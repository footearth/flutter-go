/// Created with Android Studio.
/// User: 三帆
/// Date: 15/01/2019
/// Time: 22:23
/// email: sanfan.hx@alibaba-inc.com
/// target:  CupertinoSwitchDemo

import 'package:flutter/material.dart' show
  StatefulWidget
, State
, Widget
, BuildContext
, MergeSemantics
, ListTile
, Text
, Colors
;
import 'package:flutter/cupertino.dart' show
  CupertinoSwitch
;

class CupertinoSwitchDemo extends StatefulWidget {
  _Demo createState() =>
    _Demo()
  ;
}

class _Demo extends State<CupertinoSwitchDemo> {

  bool _lights = false
  ;

  Widget build(BuildContext context) =>
    MergeSemantics(
      child: ListTile(
        title: Text('CupertinoSwitch')
      , trailing: CupertinoSwitch(
          activeColor: Colors.yellow
        , value: _lights
        , onChanged: (bool value) {
            setState( () {
              _lights = value; 
            }
            )
            ;
          }
        )
      , onTap: () {
          setState( () {
            _lights = !_lights
            ;
          }
          )
          ; 
        }
      )
    )
  ;

}
