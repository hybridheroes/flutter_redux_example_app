import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/models/models.dart';

class SizeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MyBoxSize>(
      converter: (Store<AppState> store) => store.state.boxSize,
      builder: (BuildContext context, MyBoxSize boxSize) {
        return Container(
          width: 100,
          height: 100,
          child: Center(
            child: Container(
              width: boxSize.width * 10,
              height: boxSize.height * 10,
              color: Colors.black45,
            ),
          ),
        );
      },
    );
  }
}
