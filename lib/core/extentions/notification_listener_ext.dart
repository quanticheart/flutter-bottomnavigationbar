import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

extension ScrollNotificationExt on ScrollNotification {
  bool handleScrollDirection(Function(bool) callback) {
    if (depth == 0) {
      if (this is UserScrollNotification) {
        final UserScrollNotification userScroll =
            this as UserScrollNotification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            callback(true);
            break;
          case ScrollDirection.reverse:
            callback(false);
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }
}
