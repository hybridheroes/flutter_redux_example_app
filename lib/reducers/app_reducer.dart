import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/reducers/color_reducer.dart';
import 'package:sample_flutter_redux_app/reducers/size_reducer.dart';
import 'package:sample_flutter_redux_app/reducers/shape_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    boxColor: colorReducer(state.boxColor, action),
    boxSize: sizeReducer(state.boxSize, action),
    boxShape: shapeReducer(state.boxShape, action),
  );
}
