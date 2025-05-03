import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavHelper {


  static  goto(
      BuildContext context,
      Widget widget,
      ) {
    log('=====> Going to widget $widget()', name: "log-Screen", error: widget);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  }

  static replacement(BuildContext context, Widget widget) {
    log('=====> Going to widget $widget()', name: "log-Screen", error: widget);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));
  }

  static removeAllAndNav(BuildContext context, Widget widget) {
    log('=====> Going to widget $widget()', name: "log-Screen", error: widget);

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  }
}
