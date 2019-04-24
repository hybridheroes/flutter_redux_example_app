import 'package:meta/meta.dart';

@immutable
class AppState {
  final bool reduxSetup;

  const AppState({
    @required this.reduxSetup,
  });
}
