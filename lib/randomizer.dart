import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/actions/actions.dart';
import 'package:sample_flutter_redux_app/models/api_client.dart';
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
            vm.randomize((ColorException e) {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  content: Text(
                    e.message,
                    style: TextStyle(color: e.badColor),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            });
          },
        );
      },
    );
  }
}

class _ViewModel {
  final Function(Function(ColorException)) randomize;

  _ViewModel({@required this.randomize});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      randomize: (Function(ColorException) onError) async {
        Completer completer = new Completer();
        store.dispatch(getBoxColor(completer));
        try {
          await completer.future;
        } on ColorException catch (e) {
          onError(e);
        }
      },
    );
  }
}
