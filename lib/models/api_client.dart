import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/selectors/selectors.dart';

class ColorException extends FormatException {
  final Color badColor;

  ColorException(String message, this.badColor) : super(message);
}

class ApiClient {
  static Future<MyBoxColor> getBoxColor() async {
    Random rng = new Random();

    // The data is JSON encoded only for demonstration
    var json = jsonEncode({
      'red': (rng.nextDouble() * 101).floorToDouble() / 10,
      'green': (rng.nextDouble() * 101).floorToDouble() / 10,
      'blue': (rng.nextDouble() * 101).floorToDouble() / 10,
    });

    // Simulating async call
    await Future.delayed(Duration(milliseconds: 500));

    var color = jsonDecode(json);

    // Throw a ColorException on not desired colors
    if (color['red'] < 1.0 || color['green'] < 1.0 || color['blue'] < 1.0) {
      throw new ColorException(
        'This might not be a good color $color',
        colorSelector(MyBoxColor.fromJson(color)),
      );
    }

    // Creating an instance from decoded JSON
    return MyBoxColor.fromJson(color);
  }
}
