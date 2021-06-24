import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';
import 'package:pressable/src/base.dart';

typedef PressableBuilderCallback = Widget Function(
  BuildContext context,
  bool isPressed,
  // void Function(bool active) setPressed,
);

class PressableBuilder extends Pressable {
  const PressableBuilder({
    Key? key,
    required this.builder,
    this.onPressed,
    this.onLongPressed,
  }) : super(key: key);

  final PressableBuilderCallback builder;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;

  @override
  _PressableBuilderState createState() => _PressableBuilderState();
}

class _PressableBuilderState extends PressableBaseState<PressableBuilder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onPressed != null ? onPressStarted : null,
      onTapUp: widget.onPressed != null ? onPressEnded : null,
      onTapCancel: widget.onPressed != null ? onPressCanceled : null,
      onLongPress: widget.onLongPressed,
      child: widget.builder(context, isPressed),
    );
  }
}
