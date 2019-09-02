import 'dart:async';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sample_flutter_redux_app/models/api_client.dart';
import 'package:sample_flutter_redux_app/models/models.dart';

ThunkAction<AppState> getBoxColor(Completer completer) {
  return (Store<AppState> store) async {
    try {
      MyBoxColor boxColor = await ApiClient.getBoxColor();
      store.dispatch(SetColor(boxColor));
      completer.complete();
    } on ColorException catch (e) {
      completer.completeError(e);
    }
  };
}

class SetColor {
  final MyBoxColor boxColor;

  SetColor(this.boxColor);
}

class SetSize {
  final MyBoxSize boxSize;

  SetSize(this.boxSize);
}

class SetShape {
  final double borderRadius;

  SetShape(this.borderRadius);
}
