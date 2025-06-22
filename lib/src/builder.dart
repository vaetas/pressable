import 'package:flutter/material.dart';
import 'package:pressable/src/base.dart';

/// Builds [Widget] inside [PressableBuilder].
typedef PressableBuilderCallback =
    Widget Function(BuildContext context, bool isPressed);

/// Use [PressableBuilder] to define your own pressable animation. Simplifies
/// working with [GestureDetector].
class PressableBuilder extends StatefulWidget {
  const PressableBuilder({
    super.key,
    required this.builder,
    this.onPressed,
    this.onLongPressed,
  });

  final PressableBuilderCallback builder;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;

  @override
  PressableBaseState<PressableBuilder> createState() =>
      _PressableBuilderState();
}

class _PressableBuilderState extends PressableBaseState<PressableBuilder> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor:
          (widget.onPressed != null || widget.onLongPressed != null)
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onPressed,
        onTapDown: widget.onPressed != null ? onPressStarted : null,
        onTapUp: widget.onPressed != null ? onPressEnded : null,
        onTapCancel: widget.onPressed != null ? onPressCanceled : null,
        onLongPress: widget.onLongPressed,
        child: widget.builder(context, isPressed),
      ),
    );
  }
}
