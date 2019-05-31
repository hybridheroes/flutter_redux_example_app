import 'package:sample_flutter_redux_app/models/models.dart';

class SetColor {
  final MyBoxColor boxColor;

  SetColor(this.boxColor);
}

class SetSize {
  final MyBoxSize boxSize;

  SetSize(this.boxSize);
}

class SetShape {
  final double borderRadius;

  SetShape(this.borderRadius);
}
