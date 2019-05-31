import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:sample_flutter_redux_app/models/models.dart';

@immutable
class AppState {
  final MyBoxColor boxColor;

  const AppState({
    @required this.boxColor,
  });

  dynamic toJson() => {
        'boxColor': boxColor,
      };

  @override
  String toString() {
    return 'AppState: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
