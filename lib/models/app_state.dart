import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:sample_flutter_redux_app/models/models.dart';

@immutable
class AppState {
  final MyBoxColor boxColor;
  final MyBoxSize boxSize;
  final MyBoxShape boxShape;

  const AppState({
    @required this.boxColor,
    @required this.boxSize,
    @required this.boxShape,
  });

  dynamic toJson() => {
        'boxColor': boxColor,
        'boxSize': boxSize,
        'boxShape': boxShape,
      };

  @override
  String toString() {
    return 'AppState: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
