import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:sample_flutter_redux_app/models/models.dart';
import 'package:sample_flutter_redux_app/reducers/app_reducer.dart';
import 'package:sample_flutter_redux_app/color_box.dart';
import 'package:sample_flutter_redux_app/color_controller.dart';

void main() {
  final initialState = AppState(
    boxColor: MyBoxColor(
      red: 5.0,
      green: 5.0,
      blue: 5.0,
    ),
  );

  final store = Store<AppState>(
    appReducer,
    initialState: initialState,
    middleware: [new LoggingMiddleware.printer()],
  );

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
