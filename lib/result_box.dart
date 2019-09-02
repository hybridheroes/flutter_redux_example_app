import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/selectors/selectors.dart';

class ResultBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: 100,
          height: 100,
          child: Center(
            child: Container(
              width: vm.boxSize.width * 10,
              height: vm.boxSize.height * 10,
              decoration: BoxDecoration(
                color: vm.color,
                borderRadius:
                    BorderRadius.circular(vm.boxShape.borderRadius * 5),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final Color color;
  final MyBoxSize boxSize;
  final MyBoxShape boxShape;

  _ViewModel({
    @required this.color,
    @required this.boxSize,
    @required this.boxShape,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      color: colorSelector(store.state.boxColor),
      boxSize: store.state.boxSize,
      boxShape: store.state.boxShape,
    );
  }
}
