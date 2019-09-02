import 'dart:convert';
import 'package:meta/meta.dart';

@immutable
class MyBoxColor {
  final double red;
  final double green;
  final double blue;

  const MyBoxColor({
    @required this.red,
    @required this.green,
    @required this.blue,
  });

  MyBoxColor copyWith({double red, double green, double blue}) {
    return MyBoxColor(
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
    );
  }

  MyBoxColor.fromJson(dynamic json)
      : red = json['red'],
        green = json['green'],
        blue = json['blue'];

  dynamic toJson() => {
        'red': red,
        'green': green,
        'blue': blue,
      };

  @override
  String toString() {
    return 'MyBoxColor: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
