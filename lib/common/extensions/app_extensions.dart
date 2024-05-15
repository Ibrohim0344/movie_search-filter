import 'package:flutter/material.dart';

extension Gap on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());
}

extension TextThemeStyle on BuildContext {
  TextTheme get textStyle => Theme.of(this).textTheme;
}
