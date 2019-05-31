import 'package:redux/redux.dart';
import 'package:sample_flutter_redux_app/actions/actions.dart';
import 'package:sample_flutter_redux_app/models/models.dart';

final sizeReducer = TypedReducer<MyBoxSize, SetSize>(_setSizeReducer);

MyBoxSize _setSizeReducer(MyBoxSize state, SetSize action) {
  return action.boxSize;
}
