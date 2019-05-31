import 'package:flutter/material.dart';
import 'package:sample_flutter_redux_app/models/models.dart';

colorSelector(MyBoxColor boxColor) {
  return Color.fromRGBO((boxColor.red * 25.5).round(),
      (boxColor.green * 25.5).round(), (boxColor.blue * 25.5).round(), 1);
}
