import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/reducers/app_reducer.dart';
import 'package:sample_flutter_redux_app/actions/actions.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(reduxSetup: false),
  );

  print('Initial state: ${store.state}');

  runApp(StoreProvider(store: store, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Redux Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Redux Demo'),
        ),
        body: StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.reduxSetup,
          builder: (BuildContext context, bool reduxSetup) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Redux is working: $reduxSetup'),
                  RaisedButton(
                    child: Text('Dispatch action'),
                    onPressed: () => StoreProvider.of<AppState>(context)
                        .dispatch(TestAction(true)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
