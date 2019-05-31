import 'package:redux/redux.dart';
import 'package:sample_flutter_redux_app/actions/actions.dart';
import 'package:sample_flutter_redux_app/models/models.dart';

final shapeReducer = TypedReducer<MyBoxShape, SetShape>(_setShapeReducer);

MyBoxShape _setShapeReducer(MyBoxShape state, SetShape action) {
  return MyBoxShape(borderRadius: action.borderRadius);
}
