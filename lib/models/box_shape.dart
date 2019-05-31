import 'dart:convert';
import 'package:meta/meta.dart';

@immutable
class MyBoxShape {
  final double borderRadius;

  const MyBoxShape({
    @required this.borderRadius,
  });

  dynamic toJson() => {
        'borderRadius': borderRadius,
      };

  @override
  String toString() {
    return 'MyBoxShape: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
