import 'package:flutter/material.dart' show
  TabController
;
import 'package:fluro/fluro.dart' show
  Router
;
import '../utils/shared_preferences.dart' show
  SpUtil
;

class Application {

  static Router router
  ;
  static TabController controller
  ;
  static SpUtil sharePeferences
  ;

  static Map<String, String> github = {
    'widgetsURL': 'https://github.com/alibaba/flutter-go/blob/develop/lib/widgets/'
  // , 'develop': 'https://github.com/alibaba-paimai-frontend/flutter-common-widgets-app/tree/develop/lib/widgets/'
  // , 'master': 'https://github.com/alibaba-paimai-frontend/flutter-common-widgets-app/tree/master/lib/widgets/'
  }
  ;

}
