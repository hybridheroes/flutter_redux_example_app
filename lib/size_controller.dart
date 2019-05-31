import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/actions/actions.dart';
import 'package:sample_flutter_redux_app/my_slider.dart';

class SizeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) {
        return Column(
          children: <Widget>[
            MySlider(
              value: vm.boxSize.width,
              label: 'W',
              onChanged: (val) {
                vm.onSizeChanged(vm.boxSize.copyWith(width: val));
              },
            ),
            MySlider(
              value: vm.boxSize.height,
              label: 'H',
              onChanged: (val) {
                vm.onSizeChanged(vm.boxSize.copyWith(height: val));
              },
            ),
          ],
        );
      },
    );
  }
}

class _ViewModel {
  final MyBoxSize boxSize;
  final Function(MyBoxSize) onSizeChanged;

  _ViewModel({@required this.boxSize, @required this.onSizeChanged});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      boxSize: store.state.boxSize,
      onSizeChanged: (MyBoxSize boxSize) {
        store.dispatch(SetSize(boxSize));
      },
    );
  }
}
