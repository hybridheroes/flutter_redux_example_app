import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.black45,
        ),
      ),
    );
  }
}
