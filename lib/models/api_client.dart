import 'dart:math';
import 'dart:convert';
import 'package:sample_flutter_redux_app/models/models.dart';

class ApiClient {
  static Future<MyBoxColor> getBoxColor() async {
    Random rng = new Random();

    // The data is JSON encoded only for demonstration
    var json = jsonEncode({
      'red': (rng.nextDouble() * 101).floorToDouble() / 10,
      'green': (rng.nextDouble() * 101).floorToDouble() / 10,
      'blue': (rng.nextDouble() * 101).floorToDouble() / 10,
    });

    // Simulating async call
    await Future.delayed(Duration(milliseconds: 500));

    // Creating an instance from decoded JSON
    return MyBoxColor.fromJson(jsonDecode(json));
  }
}
