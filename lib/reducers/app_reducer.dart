import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/reducers/color_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    boxColor: colorReducer(state.boxColor, action),
  );
}
