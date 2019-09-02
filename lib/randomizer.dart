import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/actions/actions.dart';
import 'package:sample_flutter_redux_app/models/models.dart';

class Randomizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) {
        return RaisedButton(
          child: Text('Randomize'),
          onPressed: () {
            vm.randomize();
          },
        );
      },
    );
  }
}

class _ViewModel {
  final VoidCallback randomize;

  _ViewModel({@required this.randomize});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      randomize: () {
        store.dispatch(getBoxColor());
      },
    );
  }
}
