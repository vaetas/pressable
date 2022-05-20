import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

/// Default [State] for more complex [Pressable] Widgets.
abstract class PressableBaseState<T extends StatefulWidget> extends State<T> {
  bool isPressed = false;

  void onPressStarted(TapDownDetails details) {
    setState(() {
      isPressed = true;
    });
  }

  void onPressEnded(TapUpDetails details) {
    setState(() {
      isPressed = false;
    });
  }

  void onPressCanceled() {
    setState(() {
      isPressed = false;
    });
  }

  void onLongPressStarted(LongPressStartDetails details) {
    setState(() {
      isPressed = true;
    });
  }

  void onLongPressEnded(LongPressEndDetails details) {
    setState(() {
      isPressed = false;
    });
  }
}
