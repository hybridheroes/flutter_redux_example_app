import 'package:redux/redux.dart';
import 'package:sample_flutter_redux_app/actions/actions.dart';

final testReducer = TypedReducer<bool, TestAction>(_testActionReducer);

bool _testActionReducer(bool state, TestAction action) {
  return action.testPayload;
}
