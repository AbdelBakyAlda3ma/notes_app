import 'package:flutter/material.dart';

abstract class Styles {
  static final titleStyle = TextStyle(
    color: Colors.black.withOpacity(0.6),
    fontSize: 32,
  );

  static const contentStyle = TextStyle(
    color: Color(0xff2e4b5b),
    fontSize: 20,
  );

  static const dateStyle = TextStyle(
    color: Color(0xff2e4b5b),
    fontSize: 18,
  );

  static final textFieldInputStyle = TextStyle(
    color: Colors.white.withOpacity(0.8),
    fontSize: 16,
  );
}
