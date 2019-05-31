import 'dart:convert';
import 'package:meta/meta.dart';

@immutable
class MyBoxSize {
  final double width;
  final double height;

  const MyBoxSize({
    @required this.width,
    @required this.height,
  });

  MyBoxSize copyWith({double width, double height}) {
    return MyBoxSize(
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  dynamic toJson() => {
        'width': width,
        'height': height,
      };

  @override
  String toString() {
    return 'MyBoxSize: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
