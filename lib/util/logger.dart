import 'package:flutter/cupertino.dart';

class RotaryLogger {
  // Singleton
  static final RotaryLogger _singleton = RotaryLogger._internal();

  factory RotaryLogger() => _singleton;

  RotaryLogger._internal();

  // Attributes
  bool logFlag = false;

  void log(String message) {
    if (logFlag) {
      debugPrint(message);
    }
  }
}