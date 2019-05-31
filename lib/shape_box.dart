import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_flutter_redux_app/models/models.dart';

class ShapeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MyBoxShape>(
      converter: (Store<AppState> store) => store.state.boxShape,
      builder: (BuildContext context, MyBoxShape boxShape) {
        return Container(
          width: 100,
          height: 100,
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius:
                      BorderRadius.circular(boxShape.borderRadius * 5)),
            ),
          ),
        );
      },
    );
  }
}
