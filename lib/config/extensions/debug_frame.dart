import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension DebugBorderWidgetExtension on Widget {
  Widget debugBorder({Color? color}) {
    if (kDebugMode) {
      return DecoratedBox(decoration: BoxDecoration(border: Border.all(color: color ?? Colors.red, width: 4)), child: this);
    } else {
      return this;
    }
  }
}
