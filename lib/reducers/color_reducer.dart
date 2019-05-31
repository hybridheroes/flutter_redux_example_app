import 'package:redux/redux.dart';
import 'package:sample_flutter_redux_app/actions/actions.dart';
import 'package:sample_flutter_redux_app/models/models.dart';

final colorReducer = TypedReducer<MyBoxColor, SetColor>(_setColorReducer);

MyBoxColor _setColorReducer(MyBoxColor state, SetColor action) {
  return action.boxColor;
}
