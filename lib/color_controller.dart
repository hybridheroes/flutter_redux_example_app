import 'package:flutter/material.dart';
import 'package:sample_flutter_redux_app/my_slider.dart';

class ColorController extends StatefulWidget {
  @override
  _ColorControllerState createState() => _ColorControllerState();
}

class _ColorControllerState extends State<ColorController> {
  double _red = 5.0;
  double _green = 5.0;
  double _blue = 5.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MySlider(
          value: _red,
          label: 'R',
          onChanged: (val) {
            setState(() {
              _red = val;
            });
          },
        ),
        MySlider(
          value: _green,
          label: 'G',
          onChanged: (val) {
            setState(() {
              _green = val;
            });
          },
        ),
        MySlider(
          value: _blue,
          label: 'B',
          onChanged: (val) {
            setState(() {
              _blue = val;
            });
          },
        ),
      ],
    );
  }
}
