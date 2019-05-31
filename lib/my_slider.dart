import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  final double value;
  final String label;
  final void Function(double) onChanged;

  MySlider(
      {@required this.value, @required this.label, @required this.onChanged});

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '${widget.label}',
        ),
        Expanded(
          child: Slider(
            value: widget.value,
            min: 0,
            max: 10,
            divisions: 10,
            onChanged: widget.onChanged,
          ),
        ),
        Text(
          '${widget.value}',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
