import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/actions/actions.dart';
import 'package:sample_flutter_redux_app/my_slider.dart';

class ShapeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) {
        return Column(
          children: <Widget>[
            MySlider(
              value: vm.boxShape.borderRadius,
              label: 'O',
              onChanged: (val) {
                vm.onShapeChanged(val);
              },
            ),
          ],
        );
      },
    );
  }
}

class _ViewModel {
  final MyBoxShape boxShape;
  final Function(double) onShapeChanged;

  _ViewModel({@required this.boxShape, @required this.onShapeChanged});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      boxShape: store.state.boxShape,
      onShapeChanged: (double value) {
        store.dispatch(SetShape(value));
      },
    );
  }
}
