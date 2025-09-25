import 'package:flutter/material.dart';

/// Time required until long press is started. Defaults to 250ms.
/// When the actions is shorter, regular `onPressed` callback is
/// called. When the action is longer, `onLongPressStart` callback is called.
const Duration kLongPressDuration = Duration(milliseconds: 250);

/// Default [State] for more complex pressable Widgets.
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
