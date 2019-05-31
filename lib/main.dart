import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/reducers/app_reducer.dart';
import 'package:sample_flutter_redux_app/color_box.dart';
import 'package:sample_flutter_redux_app/color_controller.dart';

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
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    Text('Color Controller'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: ColorController(),
                          ),
                        ),
                        ColorBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
